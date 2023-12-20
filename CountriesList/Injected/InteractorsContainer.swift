extension DependencyInjectionContainer {
    struct Interactors {
        let countriesInteractor: CountriesInteractor
        let imagesInteractor: ImagesInteractor
        let userPermissionsInteractor: UserPermissionsInteractor
        
        init(countriesInteractor: CountriesInteractor,
             imagesInteractor: ImagesInteractor,
             userPermissionsInteractor: UserPermissionsInteractor) {
            self.countriesInteractor = countriesInteractor
            self.imagesInteractor = imagesInteractor
            self.userPermissionsInteractor = userPermissionsInteractor
        }
        
        static var stub: Self {
            .init(countriesInteractor: StubCountriesInteractor(),
                  imagesInteractor: StubImagesInteractor(),
                  userPermissionsInteractor: StubUserPermissionsInteractor())
        }
    }
}
