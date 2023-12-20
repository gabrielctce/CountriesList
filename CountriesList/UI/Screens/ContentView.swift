import SwiftUI
import Combine

struct ContentView: View {
    
    private let container: DependencyInjectionContainer
    
    init(container: DependencyInjectionContainer) {
        self.container = container
    }
    
    var body: some View {
        Group {
            CountriesList()
                .inject(container)
        }
    }
}

// MARK: - Preview

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(container: .preview)
    }
}
#endif
