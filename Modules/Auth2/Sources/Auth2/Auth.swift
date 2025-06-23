// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI


public class LoginRouter {
    public var register: (_ key: String) -> Void
    public var verify: (_ key: String) -> Void
    public init(register: @escaping (_: String) -> Void, verify: @escaping (_: String) -> Void) {
        self.register = register
        self.verify = verify
    }
    deinit {
        print("deinit", String(describing: self))
    }

}
public class LoginViewModel: ObservableObject {
    let router: LoginRouter
    public init(_ router: LoginRouter) {
        self.router = router
    }
    deinit {
        print("deinit", String(describing: self))
    }
}
public struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    public init(_ viewModel: StateObject<LoginViewModel>) {
        self._viewModel = viewModel
    }
    public var body: some View {
        Text("Login")
        HStack {
            Button(action: {
                viewModel.router.register("")
            }, label: {
                Text("register")
            })
            Button(action: {
                viewModel.router.verify("")
            }, label: {
                Text("verify")
            })
        }

    }
}
public class VerifyViewModel: ObservableObject {
//    let router: AuthRouter
//    public init(router: AuthRouter) {
//        self.router = router
//    }
    public init() {}
}

public struct VerifyView: View {
    @StateObject private var viewModel: VerifyViewModel
    public init(viewModel: StateObject<VerifyViewModel>) {
        self._viewModel = viewModel
    }
    public var body: some View {
        Text("Verify")
    }
}
public protocol RegisterRouter {
    func login()
    func verify()
    func test()
}

public class RegisterViewModel: ObservableObject {
    let router: RegisterRouter
    public init(router: RegisterRouter) {
        self.router = router
    }
}
public struct RegisterView: View {
    @StateObject private var viewModel: RegisterViewModel
    public init(viewModel: StateObject<RegisterViewModel>) {
        self._viewModel = viewModel
    }
    public var body: some View {
        Text("Register")
        HStack {
            Button(action: viewModel.router.login) {
                Text("login")
            }
            Button(action: viewModel.router.verify) {
                Text("verify")
            }
        }
    }
}




