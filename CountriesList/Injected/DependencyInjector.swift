import SwiftUI
import Combine

// MARK: - DependencyInjectionContainer

struct DependencyInjectionContainer: EnvironmentKey {

    let appState: Store<AppState>
    let interactors: Interactors

    init(appState: Store<AppState>, interactors: Interactors) {
        self.appState = appState
        self.interactors = interactors
    }

    init(appState: AppState, interactors: Interactors) {
        self.init(appState: Store<AppState>(appState), interactors: interactors)
    }

    static var defaultValue: Self { Self.default }

    private static let `default` = Self(appState: AppState(), interactors: .stub)
}

extension EnvironmentValues {
    var injected: DependencyInjectionContainer {
        get { self[DependencyInjectionContainer.self] }
        set { self[DependencyInjectionContainer.self] = newValue }
    }
}

#if DEBUG
extension DependencyInjectionContainer {
    static var preview: Self {
        .init(appState: .init(AppState.preview), interactors: .stub)
    }
}
#endif

// MARK: - Injection in the view hierarchy

extension View {

    func inject(
        _ appState: AppState,
        _ interactors: DependencyInjectionContainer.Interactors
    ) -> some View {
        let container = DependencyInjectionContainer(
            appState: .init(appState),
            interactors: interactors
        )

        return inject(container)
    }

    func inject(_ container: DependencyInjectionContainer) -> some View {
        self
            .modifier(RootViewAppearance())
            .environment(\.injected, container)
    }
}
