import Foundation

class UserRepository {
    /// Заглушка для проверки наличия пользователя в хранилище. В качестве хранилища в дальнейшем может выступать например CoreData.
    ///
    /// - Parameter id: идентификатор пользователя
    /// - Returns: true - пользователь уже есть в хранилище, false - пользователя нет в хранилище.
    static func isExist(id: Int) -> Bool {
        return true
    }
}
