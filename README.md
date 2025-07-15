<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>
<!--
*** Source:
*** https://github.com/othneildrew/Best-README-Template
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![Processing][processing_second-shield]][processing-url]
[![Raspberrypi][raspberrypi_second-shield]][raspberrypi-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/olmomoreno/weatherPi_station">
    <img src="data/images/processing_2021_logo.png" alt="Logo" width="100" height="100">
  </a>

  <h3 align="center">Raspberry Pi Weather</h3>

  <p align="center">
    A Processing IoT sketch (with Raspberry Pi)
    <br />
    <a href="https://github.com/olmomoreno/weatherPi_station"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/olmomoreno/weatherPi_station">View Demo</a>
    &middot;
    <a href="https://github.com/olmomoreno/weatherPi_station/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/olmomoreno/weatherPi_station/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>📋 Table of Contents</summary>
  <ol>
    <li>
      <a href="#-about-the-project">About The Project</a>
      <ul>
        <li><a href="#%EF%B8%8F-built-with">Built With</a></li>
        <li><a href="#-bill-of-materials-bom">Bill of Materials (BoM)</a></li>
      </ul>
    </li>
    <li>
      <a href="#-getting-started">Getting Started</a>
      <ul>
        <li><a href="#-installation-processing">Installation (Processing)</a></li>
         <li><a href="#-opening-processing">Opening (Processing)</a></li>
      </ul>
    </li>
    <li><a href="#%EF%B8%8F-usage">Usage</a></li>
    <li><a href="#%EF%B8%8F-roadmap">Roadmap</a></li>
    <li><a href="#-contributing">Contributing</a></li>
    <li><a href="#-license">License</a></li>
    <li><a href="#-contact">Contact</a></li>
    <li><a href="#-acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## 📖 About The Project

[![weatherPi_station][product-screenshot]](https://github.com/olmomoreno/weatherPi_station)

This is an IoT Processing sketch. It displays four cards: (a) temperature, (b) condition, (c) city, and (d) temperature forecast. Card (a) shows the current temperature and the maximum and minimum forecasted temperatures, respectively. Card (b) presents the weather conditions, humidity percentage, UV index, sunrise, current, and sunset time. Card (c) shows the name and a picture of the selected city. Finally, card (d) displays nine hours of temperature forecast and graphic weather conditions. This sketch requires an API key from https://www.weatherapi.com. Please refer to the Usage section for a detailed description of how an API key works. It is possible to change the city’s weather information. When these cities are selected, this project’s version contains the pictures from Tokyo, Paris, and Rome; you can enter the name of other cities, and a default image will be displayed. Please refer to the Usage section to change the city for temperature and weather forecast information. This project was developed in the Wearable Robots, Exoskeletons, and Exosuits Laboratory (XoLab).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### 🛠️ Built With

* [![Processing][processing-shield]][processing-url]
* [![Raspberrypi][raspberrypi-shield]][raspberrypi-url]
* [![VSCode][vscode-shield]][vscode-url]


### 📋 Bill of Materials (BoM)

| 🔢 Qty | 🧩 Component                  | 🔍 Description                           | 🔗 Link |
|-------:|------------------------------|-------------------------------------------|:--------:|
| 1️⃣    | 🍓 **Raspberry Pi 3 Model B+**        | Third-generation single-board computer    | [Raspberry Pi 3 Model B+](https://www.raspberrypi.com/products/raspberry-pi-3-model-b-plus/) |
| 1️⃣    | 👆 **Raspberry Pi Touch Display**     | A 7″ touchscreen display for Raspberry Pi ( 800 x 480 )           | [Raspberry Pi Touch Display](https://www.raspberrypi.com/products/raspberry-pi-touch-display/) |


### 🗺️ Schematic Diagram

You can follow the Touch Display Documentation to connect the Raspberri Pi to the LCD screen: [https://www.raspberrypi.com/documentation/accessories/display.html](https://www.raspberrypi.com/documentation/accessories/display.html)

[![Raspberry Pi Touch Display][components-screenshot]](https://www.raspberrypi.com/documentation/accessories/display.html)

> [!NOTE]  
> Don't forget to connect your Raspberry Pi to the Internet.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## 🚀 Getting Started

This section will help you get Processing installed in your computer and Raspberry Pi, and show you how to open the `weatherPi_station` sketch.

### 🧩 Installation (Processing)

Follow these steps to install **Processing** on your Raspberry Pi and computer:

#### 🍓 For Raspberry Pi
1. Please follow the tutorial from: [https://pi.processing.org/get-started/](https://pi.processing.org/get-started/)

#### 🖥️ For Windows
1. 🔽 Download the latest version of Processing from the official website: [https://processing.org/download](https://processing.org/download)
2. 📦 Unzip the downloaded `.zip` file.
3. 🖱️ Open the unzipped folder and double-click `processing.exe` to launch Processing.
4. ✅ You're ready to run sketches!

#### 🐧 For Linux
1. 🔽 Download the Linux version from: [https://processing.org/download](https://processing.org/download)
2. 📦 Extract the archive (`.tar.gz`) to a folder of your choice.
3. 💻 Open a terminal and navigate to the extracted folder.
4. 🏁 Launch Processing by running:
   ```bash
   ./processing

### 📂 Opening (Processing)

To open the weatherPi_station sketch in Processing:

🧭 Launch the Processing IDE.

1. 📁 Go to File > Open...
2. 📂 Navigate to the arduino_three_joysticks folder.
3. 📄 Select the arduino_three_joysticks.pde file.
4. ▶️ Click the Run button (or press Ctrl + R) to execute the sketch.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## 🛠️ Usage

First, you need to get an API Key from: [https://www.weatherapi.com](https://www.weatherapi.com)

### 🔑 How to Get an API Key from WeatherAPI.com

Follow these simple steps to get your free API key from: [weatherapi.com](https://www.weatherapi.com)

#### 🧭 Step 1: Go to the Website
1. 🔗 Visit: [https://www.weatherapi.com](https://www.weatherapi.com)

#### 📝 Step 2: Sign Up
1. 👤 Click **Sign Up** at the top-right corner.  
2. 📧 Enter your email, choose a password, and complete the form.
3. ✅ Confirm your email if prompted.

#### 📦 Step 3: Choose a Plan
1. 💰 Select the **Free Plan** (or any other plan that fits your needs).  
2. 🎁 The free plan gives you access to current weather, forecasts, and more.

#### 🔐 Step 4: Access Your API Key
1. 🧩 Once logged in, go to your **Dashboard**.  
2. 🔑 Your API key will be displayed there — it’s a string like: [https://api.weatherapi.com/v1/current.xml?key=YOUR_API_KEY&q=London](https://api.weatherapi.com/v1/current.xml?key=YOUR_API_KEY&q=London)
3. 🌤 If it works, you’ll see weather data for London!
4. That’s it! You’re now ready to start building with WeatherAPI! 🚀


First you have to set the screen settings for Processing running on a Raspberry Pi or the computer.

🖥️ Computer `weatherPi_station` sketch, please make sure that the `fullScreen()` function is commented,a nd the size() function is uncommented as follows:
```java
void setup() {

  //fullScreen()

  //800×480px RGB LCD display
  size(800, 480);
```

🍓 Raspberry Pi  `weatherPi_station` sketch, please make sure that the `fullScreen()` function is uncommented,a nd the size() function is commented as follows:
```java
void setup() {

  fullScreen()

  //800×480px RGB LCD display
  //size(800, 480);
```

> [!IMPORTANT]  
> The GUI design of the  `weatherPi_station` sketch, relies on a configuration of 800 x 480 px. If you use full screen mode on a computer, the GUI may not display correctly.

In this sketch, the weather information belongs to the city choosen in the code.

#### 🏙️ City Definitions

```java
// Variable definitions
String apiKey = "yourAPIkey";
String location = "Tokyo";
//String location = "Paris";
//String location = "Rome";
//String location = "Madrid";
//String location = "Tijuana";
String url = "https://api.weatherapi.com/v1/forecast.xml?key=" + apiKey + "&q=" + location + "&days=1";
String localTime, currentTemp, maxTemp, minTemp, condition, humidity, uv, sunrise, sunset;
String[] forecastTemps = new String[9];
String[] forecastConditions = new String[9];
```

To change the city's weather information, uncomment the following line in the `.pde` file:
```java
String location = "Paris";
```

And comment the previous city location:

```java
// String location = "Tokyo";
```

This is the list of passess to get the weather information:
- Latitude and Longitude (Decimal degree) e.g: q=48.8567,2.3508
- city name e.g.: q=Paris
- US zip e.g.: q=10001
- UK postcode e.g: q=SW1
- Canada postal code e.g: q=G2J
- metar:<metar code> e.g: q=metar:EGLL
- iata:<3 digit airport code> e.g: q=iata:DXB
- auto:ip IP lookup e.g: q=auto:ip
- IP address (IPv4 and IPv6 supported) e.g: q=100.0.0.1
- By ID returned from Search API. e.g: q=id:2801268

The complete list can be found at the Weather API website: [https://www.weatherapi.com/docs/#intro-request](https://www.weatherapi.com/docs/#intro-request)

> [!NOTE]  
> Some times the weather condition message comes with a space after the condition (e.g. "Cloudy "). When this is the case, the weather condition list does not match, and the weather icon for the forecast temperatures displays an error icon.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## 🗺️ Roadmap

- [x] Add cards GUI
- [x] Add basic card text
- [x] Add card 3 image (Location)
- [x] Get weather API key from: [https://www.weatherapi.com](https://www.weatherapi.com)
- [x] Set card 1 info (Weather)
- [X] Set card 2 info (Astro and weather)
- [X] Set card 3 info (Weather forecast)
- [X] Set color to temperature bars in card 3
- [X] Set icon aligment with condition in card 2
- [X] Correct card 2 text title (when condition is too long text)
- [X] Set icon aligment with condition in card 3
- [X] Correct forecast to 2-day forecast
- [X] Change of city

See the [open issues](https://github.com/olmomoreno/weatherPi_station/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## 🤝 Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/weatherPi_station`)
3. Commit your Changes (`git commit -m 'Add some weatherPi_station'`)
4. Push to the Branch (`git push origin feature/weatherPi_station`)
5. Open a Pull Request

### 🏆 Top contributors:

<a href="https://github.com/olmomoreno/weatherPi_station/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=olmomoreno/weatherPi_station" alt="contrib.rocks image" />
</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## 📄 License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## 📬 Contact

Olmo A. Moreno F. - [Linkedin](https://www.linkedin.com/in/olmo-alonso-moreno-franco/)

Project Link: [https://github.com/olmomoreno/weatherPi_station](https://github.com/olmomoreno/weatherPi_station)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## 🎉 Acknowledgments

Template adapted from [othneildrew/Best-README-Template](https://github.com/othneildrew/Best-README-Template)

Photo by Evgeny Tchebotarev: https://www.pexels.com/photo/low-angle-shot-of-the-tokyo-skytree-2187430/
Photo by Thorsten technoman: https://www.pexels.com/photo/picture-of-eiffel-tower-338515/
Photo by Chait Goli: https://www.pexels.com/photo/colosseum-italy-1797161/
Photo by Aleksejs Bergmanis: https://www.pexels.com/photo/aerial-photo-of-buildings-and-roads-681335/

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/olmomoreno/arduino_three_joysticks.svg?style=for-the-badge
[contributors-url]: https://github.com/olmomoreno/arduino_three_joysticks/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/olmomoreno/arduino_three_joysticks.svg?style=for-the-badge
[forks-url]: https://github.com/olmomoreno/arduino_three_joysticks/network/members
[stars-shield]: https://img.shields.io/github/stars/olmomoreno/arduino_three_joysticks.svg?style=for-the-badge
[stars-url]: https://github.com/olmomoreno/arduino_three_joysticks/stargazers
[issues-shield]: https://img.shields.io/github/issues/olmomoreno/arduino_three_joysticks.svg?style=for-the-badge
[issues-url]: https://github.com/olmomoreno/arduino_three_joysticks/issues
[license-shield]:  https://img.shields.io/badge/LICENSE-MIT_LICENSE-FFFFFF.svg?style=for-the-badge
[license-url]: https://github.com/olmomoreno/arduino_three_joysticks/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: data/images/weatherPi_station.png
[components-screenshot]: data/images/display.png
[processing-shield]: https://img.shields.io/badge/Designed_for-Processing-FFFFFF.svg?style=for-the-badge&logo=processingfoundation
[processing_second-shield]: https://img.shields.io/badge/Processing-006699.svg?style=for-the-badge&logo=processingfoundation
[processing-url]: https://processing.org/
[raspberrypi-shield]: https://img.shields.io/badge/Tested_with-RaspberryPi-FFFFFF.svg?style=for-the-badge&logo=raspberrypi
[raspberrypi_second-shield]: https://img.shields.io/badge/RaspberryPi-006699.svg?style=for-the-badge&logo=raspberrypi
[raspberrypi-url]: https://www.raspberrypi.com
[vscode-shield]: https://img.shields.io/badge/Coded_with-VSCode-FFFFFF.svg?style=for-the-badge
[vscode-url]: https://code.visualstudio.com/
