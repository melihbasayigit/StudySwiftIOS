//
//  ViewController.swift
//  Clima
//
//  Created by Melih Başayiğit on 19.12.2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, WeatherManagerDelegate, UITextFieldDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var serachButton: UIButton!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        cityNameTextField.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    @IBAction func serachClicked(_ sender: UIButton) {
        cityNameTextField.endEditing(true)
        locationManager.stopUpdatingLocation()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityNameTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = cityNameTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        cityNameTextField.text = ""
        
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.imageView.image = UIImage(systemName: weather.conditionName)
            self.cityNameLabel.text = "\(weather.cityName): \(weather.temperatureString)"
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    // MARK: CLLocationManager Delegate
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: latitude, longitude: longitude)
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        print(error)
    }
    
}
