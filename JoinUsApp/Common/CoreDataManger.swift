//
//  CoreDataManger.swift
//  JoinUsApp
//
//  Created by 강민성 on 3/13/25.
//

import UIKit
import CoreData

// MARK: - Core Data Manager
class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JoinUsApp")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveUser(email: String, password: String, nickname: String) -> Bool {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let existingUsers = try context.fetch(fetchRequest)
            if !existingUsers.isEmpty {
                return false // 중복된 이메일 존재
            }
            
            let newUser = UserData(context: context)
            newUser.email = email
            newUser.password = password
            newUser.nickname = nickname
            
            try context.save()
            UserDefaults.standard.set(email, forKey: "loggedInUser") // 로그인 상태 저장
            return true
        } catch {
            print("Failed to save user: \(error)")
            return false
        }
    }
    
    func getUser(email: String) -> UserData? {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let users = try context.fetch(fetchRequest)
            return users.first
        } catch {
            print("Failed to fetch user: \(error)")
            return nil
        }
    }
    
    func deleteUser(email: String) {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let users = try context.fetch(fetchRequest)
            for user in users {
                context.delete(user)
            }
            try context.save()
            UserDefaults.standard.removeObject(forKey: "loggedInUser") // 로그인 정보 삭제
        } catch {
            print("Failed to delete user: \(error)")
        }
    }
}

// MARK: - 이메일 및 비밀번호 검증
func isValidEmail(_ email: String) -> Bool {
    let emailRegex = "^[a-z][a-z0-9]{5,19}@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
    return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
}

func isValidPassword(_ password: String) -> Bool {
    let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
}
