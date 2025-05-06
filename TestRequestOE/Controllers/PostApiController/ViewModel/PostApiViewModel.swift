//
//  PostApiViewModel.swift
//  TestRequestOE
//
//  Created by Aleksandr on 04.05.2025.
//

import SwiftUI
import Combine

struct Position {
    let id: UUID
    var idPosition: Int
    var name: String
}

final class PostApiViewModel: ObservableObject {
    
    weak var coordinator: (TabCoordinatorInterface)?
    @Published var userPhone: String = ""
    @Published var userEmail: String = ""
    @Published var username: String = ""
    @Published var isCompletedUser: Bool = false
    @Published var isCorrectField: Bool = false
    @Published var isSelectedPositionStr: String = ""
    @Published var messageName: String = ""
    @Published var messageEmail: String = ""
    @Published var messagePhone: String = "+38 (XXX) XXX - XX - XX"
    @Published var selectedImage: UIImage?
    private var strImage: String?
    var messagePhoto: String = ""
    let phone: String = "Phone"
    let email: String = "Email"
    let name: String = "Name"
    let titleText: String = "Working with POST request"
    var user: RegistrUser = RegistrUser(name: "", email: "", phone: "", position_id: 0, photo: "")
    var positions: [Position] = []
    private var fetcher: DataFetcherInterface
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: TabCoordinatorInterface, fetcher: DataFetcherInterface = DataFetcher()) {
        self.coordinator = coordinator
        self.fetcher = fetcher
      
        self.fetcher.getPosition { position in
            position.forEach { posit in
                self.positions.append(Position(id: UUID(), idPosition: posit.id ?? 1, name: posit.name ?? "None"))
            }
        }
        
        $userPhone
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.validateUser()
            }
            .store(in: &cancellables)
        $userEmail
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.validateUser()
            }
            .store(in: &cancellables)
        $username
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.validateUser()
            }
            .store(in: &cancellables)
    }
    
    func updateField() {
        userPhone = ""
        userEmail = ""
        username = ""
        messageName = ""
        messageEmail = ""
        messagePhone = "+38 (XXX) XXX - XX - XX"
        isSelectedPositionStr = ""
        strImage = nil
        isCorrectField = false
        isCompletedUser = false
    }
    
    func ifValidUserName() -> Bool {
        guard username.count > 1 && username.count < 61 else {
            messageName = "Username should contain 2-60 characters"
            return false
        }
        messageName = ""
        return true
    }
    
    func ifValidEmail() -> Bool {
        guard !userEmail.isEmpty,
            isValid(userEmail) else {
            messageEmail = "Invalid email"
            return false
        }
        messageEmail = ""
        return true
    }
    
    func ifValidPhone() -> Bool {
        guard validatePhone(phone: userPhone),
            userPhone.hasPrefix("+380") && userPhone.count == 13 else {
            messagePhone = "Incorrect phone number"
            return false
        }
        messagePhone = "+38 (XXX) XXX - XX - XX"
        return true
    }
    
    private func validatePhone(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    
    private func isValid(_ email: String) -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
        "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func convertImage() {
        guard let image = selectedImage else { return }
        let imageData: Data? = image.jpegData(compressionQuality: 0.4)
        let imageStr = imageData?.base64EncodedString(options: .lineLength64Characters) ?? ""
        strImage = imageStr
        validateUser()
    }
    
    func validateUser() {
        if selectedImage != nil, ifValidUserName(), ifValidEmail(), ifValidPhone() {
            isCompletedUser = true
        }
    }
    
    func checkIfValidData() {
        
       let name = ifValidUserName()
       let email = ifValidEmail()
       let phone = ifValidPhone()
        messagePhoto = strImage == nil ? "Required field" : ""
        if name == false {
            isCorrectField = true
        }
        if email == false {
            isCorrectField = true
        }
        if phone == false {
            isCorrectField = true
        }
        if strImage == nil {
            isCorrectField = true
        }
    }
    
    func registrUser() {
         checkIfValidData()
        guard let image = strImage,
        ifValidUserName(),
        ifValidEmail(),
        ifValidPhone() else { return }
        
        if testInternet() {
            updateField()
            let positin = positions.first(where: {$0.name == isSelectedPositionStr})
            let user = RegistrUser(name: username, email: userEmail, phone: userPhone, position_id: positin?.idPosition ?? 1, photo: image)
            fetcher.postUser(user) { [weak self] result in
                guard let self = self else { return }
                if result.success == true {
                    self.coordinator?.eventOccurred(with: .successfulRegistration)
                }
                if result.message == NetworkErrors.emailAlreadyExist.error {
                    self.coordinator?.eventOccurred(with: .emailAlreadyExists)
                }
            }
        }
    }
    
    func testInternet() -> Bool {
        if Connectivity.isConnectedToNetwork() {
            return true
        } else {
            coordinator?.eventOccurred(with: .noInternet)
            return false
        }
    }
}
