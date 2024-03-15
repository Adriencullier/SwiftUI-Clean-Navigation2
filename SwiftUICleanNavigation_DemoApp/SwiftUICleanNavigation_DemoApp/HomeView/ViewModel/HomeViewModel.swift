import Navigation
import Combine

final class HomeViewModel: NavViewModel {
    typealias Router = HomeRouter
    
    @Published var router: HomeRouter
    var subscription: AnyCancellable?
    
    init(router: HomeRouter) {
        self.router = router
        self.routerSubscription()
    }
    
    func onModalButtonPressed() {
        self.router.navigate(to: .modalView(dismissAction: {
            self.router.dismiss()
        }))
    }

    func onPushButtonPressed() {
        self.router.navigate(to: .pushView(backAction: {
            self.router.dismiss()
        }))
    }
}
