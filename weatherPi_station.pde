/*****************************************************************
**  SCENE: This scene design consist of four cards:             **
**  (a) temperature,                                            **
**  (b) condition, (c) city, and                                **
**  (d) temperature forecast.                                   **
**  Card (a) shows the current temperature and the maximum and  **
**  minimum forecast temperatures, respectively. Card (b)       **
**  presents the weather conditions, humidity percentage, UV    **
**  index, sunrise, current, and sunset time. Card (c) shows    **
**  the name and a picture of the selected city. Finally, card  **
**  (d) displays nine hours of temperature forecast and graphic **
**  weather conditions.                                         **
*****************************************************************/

//Images
PImage rocketIcon;
PImage xolabLogo;
PImage tokyoPicture; // Photo by Evgeny Tchebotarev: https://www.pexels.com/photo/low-angle-shot-of-the-tokyo-skytree-2187430/
PImage parisPicture; // Photo by Thorsten technoman: https://www.pexels.com/photo/picture-of-eiffel-tower-338515/
PImage romePicture; // Photo by Chait Goli: https://www.pexels.com/photo/colosseum-italy-1797161/
PImage defaultCity; //Photo by Aleksejs Bergmanis: https://www.pexels.com/photo/aerial-photo-of-buildings-and-roads-681335/
PImage[] card2StaticIcons = new PImage[5];
PImage[] card4DynamicIcons = new PImage[9];
PImage sunnyIcon;
PImage bedtimeIcon;
PImage boltIcon;
PImage cloudIcon;
PImage foggyIcon;
PImage partlyCloudDayIcon;
PImage rainyIcon;
PImage snowyIcon;
PImage errorIcon;

// Sketch's fonts
PFont robotoRegular12;
PFont robotoRegular14;
PFont robotoRegular16;
PFont robotoRegular20;
PFont robotoRegular24;
PFont robotoRegular70;

// Color definitions
color green1 = color(29,185,84); 
color green2 = color(35, 124, 102); 
color green3 = color(165, 207, 114); 
color green4 = color(143, 187, 30); 
color green5 = color(50, 156, 52); 
color green6 = color(25, 146, 56); 
color gray1 = color(33, 33, 33);
color gray2 = color(83, 83, 83);
color white = color(255);
color black = color(0);
color purple1 = color(101, 35, 128);
color pink1 = color(235, 154, 192);
color yellow1 = color(245, 228, 16);
color orange1 = color(255, 181, 20);
color orange2 = color(237, 140, 1);
color red1 = color(255, 20, 86);
color blue1 = color(137, 201, 245);
color blue2 = color(0, 169, 198);

// Variable definitions
String apiKey = "YOUR_API_KEY";
String location = "Tokyo";
//String location = "Paris";
//String location = "Rome";
//String location = "Madrid";
//String location = "Tijuana";
String url = "https://api.weatherapi.com/v1/forecast.xml?key=" + apiKey + "&q=" + location + "&days=2";
String localTime, currentTemp, maxTemp, minTemp, condition, humidity, uv, sunrise, sunset;
String period = " AM";
String[] forecastTemps = new String[9];
String[] forecastConditions = new String[9];
int marqueeX = 293;
int marqueeXbis = 800;
int previousMinute;

void setup() {

  //fullScreen();

  //800×480px RGB LCD display
  size(800, 480);
  
  // Loads images
  rocketIcon = loadImage("images/rocket_launch_24dp_FFFFFF.png");
  xolabLogo  = loadImage("images/xolabLogo.png");
  tokyoPicture = loadImage("images/pexels-evgeny-tchebotarev-1058775-2187430.jpg");
  parisPicture = loadImage("images/pexels-thorsten-technoman-109353-338515.jpg");
  romePicture = loadImage("images/pexels-chaitaastic-1797161.jpg");
  defaultCity = loadImage("images/pexels-vividcafe-681335.jpg");
  sunnyIcon = loadImage("images/sunny.png");
  bedtimeIcon  = loadImage("images/bedtime_48dp.png");
  boltIcon = loadImage("images/bolt_48dp.png");
  cloudIcon = loadImage("images/cloud_48dp.png");
  foggyIcon = loadImage("images/foggy_48dp.png");
  partlyCloudDayIcon = loadImage("images/partly_cloudy_day_48dp.png");
  rainyIcon = loadImage("images/rainy_48dp.png");
  snowyIcon = loadImage("images/weather_snowy_48dp.png");
  errorIcon = loadImage("images/close_48dp.png");
  for (int i = 0; i < card2StaticIcons.length; i++) { // Loads images for card 2
    card2StaticIcons[i] = loadImage("images/card2StaticIcon" + i + ".png");
  }
  for (int i = 0; i < card4DynamicIcons.length; i++) { // Loads images for card 4
    card4DynamicIcons[i] = loadImage("images/sunny.png");
  }

  // Creates font
  robotoRegular12 = createFont("fonts/Roboto-Regular.ttf", 12);
  robotoRegular14 = createFont("fonts/Roboto-Regular.ttf", 14);
  robotoRegular16 = createFont("fonts/Roboto-Regular.ttf", 16);
  robotoRegular20 = createFont("fonts/Roboto-Regular.ttf", 20);
  robotoRegular24 = createFont("fonts/Roboto-Regular.ttf", 24);
  robotoRegular70 = createFont("fonts/Roboto-Regular.ttf", 70);

  previousMinute = minute(); // store starting minute

  // Gets weather values from: https://api.weatherapi.com
  loadWeather();

  // for(int i = 0; i < 9; i++){
  //   int numCharsis = forecastConditions[i].length();
  //   println(forecastConditions[i] + " " + numCharsis);
  // }
}

void draw() {

   background(black);

  // Paddings (units -> px)
  int padding28 = 28;
  int padding40 = 40;
  int padding70 = 70;
  int statusBarHeight = 24;
  int topAppBarHeight = 45;
  int margin = 16;

  // Font size
  int fontSize12 = 12;
  int fontSize14 = 14;
  int fontSize16 = 16;
  int fontSize20 = 20;
  int fontSize24 = 24;
  int fontSize70 = 70;

  // Draws status bar image
  int iconSize = 16;
  int iconOffset = 4;
  image(rocketIcon, width - margin - iconSize, iconOffset, iconSize, iconSize);

  // Draws Top App Bar
  noStroke(); 
  fill(gray1);
  rect(0, statusBarHeight, width, topAppBarHeight);

  // Draws top app bar image
  int logoWidth = 174;
  int logoHeight = 39;
  int logoOffset = 3;
  image(xolabLogo, (width/2) - (logoWidth/2), statusBarHeight + logoOffset, logoWidth, logoHeight);

  // Draws cards (card 2 right)
  int numCards = 3;
  int cardWidth = (width - (margin * 4))/numCards; // Card with = 245 px
  int roundCorners = 25;
  int cardIni = margin;
  int cardHeightOffset = 12;
  int cardHeight = (height - statusBarHeight - topAppBarHeight - (margin * 2) - cardHeightOffset)/2;
  fill(gray2);
  cardIni = cardIni + margin + cardWidth; // Draws card 2 first
  rect(cardIni, statusBarHeight + topAppBarHeight + margin, cardWidth, cardHeight, roundCorners);

  // Text marquee effect when condition variable characters is longer than 19 (condition.length() > 19)
  int conditionCharsLimit = 19; // E.g. condition = "Moderate or heavy r"; 
  int numChars = condition.length();

  // Writes card title (card 2)
  fill(white);
  textFont(robotoRegular24, fontSize24);
  
  if(numChars >= conditionCharsLimit){
    String conditionOnce = "      " + condition;
    String conditionTwice = "      " + condition;
    int widthInPixels = int(textWidth(conditionOnce));
    int marqueePosX = marqueeX + widthInPixels; // Position X of end of text 1
    int marqueeBisPosX = marqueeXbis + widthInPixels; // Position X of end of text 2
    int card2rightPos = margin + cardWidth * 2; // Position X of card 2 right border
    if(marqueePosX == card2rightPos) marqueeXbis = margin * 2 + cardWidth * 2; // When end of text 1 matches card 2 right border, places text 2 in the right border
    if(marqueeBisPosX == card2rightPos) marqueeX = margin * 3 + cardWidth * 2; // When end of text 2 matches card 2 right border, places text 1 in the right border
    marqueeX--; 
    marqueeXbis--;
    text(conditionOnce, marqueeX, statusBarHeight + topAppBarHeight + margin + padding40);
    text(conditionTwice, marqueeXbis, statusBarHeight + topAppBarHeight + margin + padding40);
  } 
  else{
    marqueeX = margin * 3 + cardWidth;
    text(condition, marqueeX, statusBarHeight + topAppBarHeight + margin + padding40);
  }
  
  // Draws cards (card 1 left)
  fill(gray2);
  cardIni = margin;
  rect(cardIni, statusBarHeight + topAppBarHeight + margin, cardWidth, cardHeight, roundCorners);
  for (int i = 0; i < 2; i++) { // Sets cadIni for next card (card 3)
    cardIni = cardIni + margin + cardWidth;
  }

  // Draws cards (card 3 long height)
  cardHeight = height - statusBarHeight - topAppBarHeight - (margin * 2);
  rect(cardIni, statusBarHeight + topAppBarHeight + margin, cardWidth, cardHeight, roundCorners);

  // Draws cards (card 4 long width)
  cardHeight = (height - statusBarHeight - topAppBarHeight - (margin * 2) - cardHeightOffset)/2;
  int card4Y = statusBarHeight + topAppBarHeight + margin * 2 + cardHeight;
  int cardWideWidth = width - margin * 3 - cardWidth;
  cardIni = margin;
  rect(cardIni, card4Y, cardWideWidth, cardHeight, roundCorners);

  // Draws marquee effect patches, this patches avoid that the marquee text appears outside its display zone
  int patchOffset = 18;
  int patchX = 0;
  int patchY = statusBarHeight + topAppBarHeight + margin + patchOffset;
  int patchWidth = margin;
  int patchHeight = padding28;
  fill(black); // Draws black patches (same color as background)
  for(int i = 0; i < 3; i++){
    rect(patchX, patchY, patchWidth, patchHeight, 0);
    patchX = patchX + cardWidth + margin;
  }
  patchWidth = 17;
  rect(patchX, patchY, patchWidth, patchHeight, 0);
  fill(gray2); // Draws gray patches (same color as card)
  patchWidth = margin;
  patchOffset = 21;
  patchX = cardWidth + margin * 2;
  patchY = statusBarHeight + topAppBarHeight + margin + patchOffset;
  rect(patchX, patchY, patchWidth, patchHeight, 0);
  patchX = patchX + cardWidth - margin;
  rect(patchX, patchY, patchWidth, patchHeight, 0);

  // Draws card 2 icons
  int card2IconY = 180;
  int card2IconX = margin * 3 + cardWidth;
  int[] nextIconX = {25, 70, 70, 25, 25};
  iconSize = 24;
  card2StaticIcons[2] = conditionIcon(condition); // Gets the icon accordingly to the current condition
  for(int i = 0; i < card2StaticIcons.length; i++){
    image(card2StaticIcons[i], card2IconX, card2IconY, iconSize, iconSize);
    card2IconX += nextIconX[i];
  }

  // Draws card 3 image
  int[] paris = {538, 210, 245, 163}; // Paris picture X, Y, Width, and Height (original size 3003 x 2000)
  int[] rome = {538, 210, 245, 137}; // Rome picture X, Y, Width, and Height (original size 6000 x 3376)
  int[] tokyo = {538, 210, 245, 163}; // Tokyo picture X, Y, Width, and Height (original size 6000 x 4000)
  int[] defCity = {538, 210, 245, 137}; // Default city picture X, Y, Width, and Height (original size 5464 x 3070)
  if(location.equals("Paris")){
    image(parisPicture, paris[0], paris[1], paris[2], paris[3]);
  }
  else if(location.equals("Rome")){
    image(romePicture, rome[0], rome[1], rome[2], rome[3]);
  }
  else if(location.equals("Tokyo")){
    image(tokyoPicture, tokyo[0], tokyo[1], tokyo[2], tokyo[3]);
  }
  else{
    image(defaultCity, defCity[0], defCity[1], defCity[2], defCity[3]);
  }

  // Draws card 4 icons
  int card4IconXOffset = 15;
  int card4IconX = margin * 2 + card4IconXOffset;
  int card4IconY = height - statusBarHeight - topAppBarHeight - margin - cardWidth/2 + cardHeightOffset + padding28 * 2;
  int card4IconXStep = 53;
  for(int i = 0; i < card4DynamicIcons.length; i++){
    card4DynamicIcons[i] = conditionIcon(forecastConditions[i]); // Gets the icon accordingly to the forecast condition
    image(card4DynamicIcons[i], card4IconX, card4IconY, iconSize, iconSize);
    card4IconX += card4IconXStep;
  }
  
  // Writes clock time
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  int textOffsetHeight = 6;
  String time = nf(h, 2) + ":" + nf(m, 2);
  fill(white);
  textFont(robotoRegular16, fontSize16);
  text(time, margin, statusBarHeight - textOffsetHeight);

  // Writes cards titles (card 1 and card 3)
  int cardTextX = margin * 2;
  String[] cardTitle = { "Temperature", "", location }; // Variables displayed to text
  textFont(robotoRegular24, fontSize24);
  for (int i = 0; i < cardTitle.length; i++) {
    text(cardTitle[i], cardTextX, statusBarHeight + topAppBarHeight + margin + padding40);
    cardTextX = cardTextX + margin + cardWidth;
  }

  // Writes cards subtitles (card 1, card 2 and card 3)
  int paddingOffset = 5;
  cardTextX = margin * 2;
  String locationCountry = "--"; // Shows double hypen if selected location is different from the list below
  if(location.equals("Paris")) locationCountry = "France";
  if(location.equals("Rome")) locationCountry = "Italy";
  if(location.equals("Tokyo")) locationCountry = "Japan";
  String[] cardSubTitle = { "Max: " + maxTemp + "°c  -  Min: " + minTemp + "°c", "Humidity: " + humidity + "%     UV Index: " + uv, locationCountry }; // Variables displayed to text
  textFont(robotoRegular16, fontSize16);
  for (int i = 0; i < cardSubTitle.length; i++) {
    text(cardSubTitle[i], cardTextX, statusBarHeight + topAppBarHeight + margin + padding70 + paddingOffset);
    cardTextX = cardTextX + margin + cardWidth;
  }

  // Writes card data (card 2)
  int cardTextXOffset = 80;
  cardTextX = margin * 3 + cardWidth;
  card2IconY += iconSize * 1.7;
  correctTime(); // Removes the 0 from e.g. 05:30 AM time formats
  time = convertTo12HourString(localTime);
  String[] card2data = { sunrise, time, sunset }; // Variables displayed to text
  textFont(robotoRegular14, fontSize14);
  for(int i = 0; i < card2data.length; i++){
    text(card2data[i], cardTextX, card2IconY);
    cardTextX += cardTextXOffset;
  }

  // Writes cards labels (card 2)
  cardTextXOffset = 80;
  cardTextX = margin * 3 + cardWidth;
  String[] cardLabel = { "Sunrise", "   Now", "Sunset" }; // Variable labels
  textFont(robotoRegular16, fontSize16);
  for (int i = 0; i < cardSubTitle.length; i++) {
    text(cardLabel[i], cardTextX, statusBarHeight + topAppBarHeight + margin + padding70 * 2 + padding28);
    cardTextX = cardTextX + cardTextXOffset;
  }

  // Writes text variables for card 1 (Temperature)
  cardTextX = margin * 2;
  textFont(robotoRegular70, fontSize70);
  text(currentTemp + "°c", cardTextX, statusBarHeight + topAppBarHeight + margin + (padding70 * 2) + padding28);

  // Writes text variables for card 4 (forecast time and temperature)
  cardTextXOffset = 7;
  int card3YOffset = 12;
  int card3Y = height - statusBarHeight - topAppBarHeight - margin - cardWidth/2 + cardHeightOffset + padding28;
  int cardTextXStep = 53;
  int hourForecast = 0;

  hourForecast = getLocalTimeHour(localTime);

  if(hourForecast >= 12){ // Checks if local time is PM
    period = " PM"; // Sets period to PM
  }
  else{
    period = " AM"; // Sets period to AM
  }
  
  hourForecast = convertTo12HourInt(hourForecast); // Gets local time and convert it in 12hr format
  textFont(robotoRegular14, fontSize14);
  for(int i = 1; i <= forecastTemps.length; i++){ // Writes the forecast for the next 9 hours

    if(hourForecast == 12){ // Prevents overflow
      hourForecast = 0; // Limits next hour time to 12hr format
    }
     
    hourForecast++;

    if(hourForecast == 12){ // Checks if next hour is 12
      if(period.equals(" PM")){
        period = " AM"; // Sets period to AM
      }
      else if(period.equals(" AM")){
        period = " PM"; // Sets period to PM
      }
    }

    String forecastTime = str(hourForecast);
    String forecastTemperature = "";
    forecastTime = forecastTime + period;
    forecastTemperature = forecastTemps[i - 1] + "°c";
    text(forecastTime, cardTextX + cardTextXOffset, card3Y + card3YOffset);
    text(forecastTemperature, cardTextX + cardTextXOffset, card3Y + card3YOffset + padding28 * 2.5);
    cardTextX += cardTextXStep;
  }
  
  // Draws card 4 temperature bars
  int barTempX = margin *2;
  int barTempY = 410;
  int barTempStepX = 6;
  int barTempWidth = 5;
  int barHeightMax = 40;
  int barBlock = 9;
  int barTemp = 79;
  hourForecast = getLocalTimeHour(localTime); // Gets local time 
  for(int i = 0; i < forecastTemps.length; i++){
    if(i == forecastTemps.length -1 ) barBlock = 7; // Limits to 7 the number of bars for the last forecastTemps block

    hourForecast++;

    if(hourForecast == 24){ // Prevents overflow
      hourForecast = 0; // Limits next hour time 
    }

    for(int j = 0; j < barBlock; j++){
      float barTempHeight = map(float(forecastTemps[i]), float(minTemp), float(maxTemp), 1, barHeightMax); // Maps forecastTemps to barTempHeight
      if(int(barTempHeight) > barHeightMax) barTempHeight = float(barHeightMax); // Limits barTempHeight top lenght
      if(int(barTempHeight) < 1) barTempHeight = 1.0; // Limits barTempHeight min lenght
      int barHeightDifference = barTempY + barHeightMax - int(barTempHeight); // Generates the rect Y position
      color barTempColor = pickUpColor(hourForecast);
      fill(barTempColor);
      rect(barTempX, barHeightDifference, barTempWidth, int(barTempHeight));
      barTempX += barTempStepX;
    }
  }

  // Check for minute change
  if (m != previousMinute) {
    previousMinute = m;
    // Gets weather values from: https://api.weatherapi.com
    loadWeather();
  }
}

// |-- This is a subfunction of XXX() --|
// Loads weather
// This function retrieves the weather information from https://weatherapi.com
void loadWeather() {

  XML weather = loadXML(url);

  if (weather == null) {
    println("Error loading weather data.");
    return;
  }

  XML location = weather.getChild("location");
  XML current = weather.getChild("current");
  XML[] forecastdays = weather.getChild("forecast").getChildren("forecastday");

  // First day info (for max/min temps, sunrise/sunset)
  XML today = forecastdays[0];
  XML day = today.getChild("day");
  XML astro = today.getChild("astro");

  localTime = location.getChild("localtime").getContent();
  currentTemp = current.getChild("temp_c").getContent();
  condition = current.getChild("condition").getChild("text").getContent();
  humidity = current.getChild("humidity").getContent();
  uv = current.getChild("uv").getContent();

  maxTemp = day.getChild("maxtemp_c").getContent();
  minTemp = day.getChild("mintemp_c").getContent();

  sunrise = astro.getChild("sunrise").getContent();
  sunset = astro.getChild("sunset").getContent();

  // Combine hours from both days into one list
  XML[] hoursToday = forecastdays[0].getChildren("hour");
  XML[] hoursTomorrow = forecastdays[1].getChildren("hour");

  XML[] allHours = (XML[]) concat(hoursToday, hoursTomorrow);

  int nowHour = hour(); // current hour (0–23)

  for (int i = 0; i < 9; i++) {
    int idx = nowHour + i;

    if (idx < allHours.length) {
      XML hourData = allHours[idx];
      forecastTemps[i] = hourData.getChild("temp_c").getContent();
      forecastConditions[i] = hourData.getChild("condition").getChild("text").getContent();
    } else {
      forecastTemps[i] = "-";
      forecastConditions[i] = "N/A";
    }
  }
}

// |-- This is a subfunction of draw() --|
// Correct time
// This function removes the 0 from 05:30 AM time formats
void correctTime(){

  // Corrects for sunrise and sunset time e.g. 05:30 AM -> 5:30 AM
  String[] sunriseparts = sunrise.split(":"); // Splits in two elements, ":" splitter
  String[] sunsetparts = sunset.split(":"); // Splits in two elements, ":" splitter
  int hourInt = int(sunriseparts[0]); // Converts to integer to remove '0'
  String cleanHour = str(hourInt);   // Converts to string
  String cleanTime = cleanHour + ":" + sunriseparts[1]; // Merges with second element
  sunrise = cleanTime;

  hourInt = int(sunsetparts[0]); // Converts to integer to remove '0'
  cleanHour = str(hourInt);   // Converts to string
  cleanTime = cleanHour + ":" + sunsetparts[1]; // Merges with second element
  sunset = cleanTime;
}

// |-- This is a subfunction of draw() --|
// Convert to 12 hour format (String)
// This function converts to 12 hrs time format
String convertTo12HourString(String time24) {

  String[] parts = time24.split(":");
  if (parts.length != 2) return time24;  // return original if format is wrong

  String[] hourParts = parts[0].split(" ");

  int hour = int(hourParts[1]);
  String minute = parts[1];
  String period = " AM";

  if (hour >= 12) {
    period = " PM";
    if (hour > 12) {
      hour -= 12;
    }
  } else if (hour == 0) {
    hour = 12;  // midnight edge case
  }

  return hour + ":" + minute + period;
}

// |-- This is a subfunction of draw() --|
// Convert to 12 hour format (integer)
// This function converts to 12 hrs time format
int convertTo12HourInt(int time24){

  // Limits format to 12 hr
  if (time24 > 12) {
    time24 -= 12;
  }
  else if (time24 == 0) {
    time24 = 12;  // midnight edge case
  }
  return time24;
}

// |-- This is a subfunction of draw() --|
// Convert the local time string to integer (just the hour part) from the weather api
// This function returns the hours of the local time
int getLocalTimeHour(String localTime){

  int localTimeHour = 0;
  String[] localTimeParts = localTime.split(" ");
  String[] localTimePartsTime = localTimeParts[1].split(":");
  localTimeHour = int(localTimePartsTime[0]);
  return localTimeHour;
}

// |-- This is a subfunction of draw() --|
// Picks color up
// This function returns a color accordingly to the forecast time
color pickUpColor(int time){

  color colorPick = color(0, 0, 0);
    
  if(time == 0) colorPick = yellow1;
  if(time == 1) colorPick = purple1;
  if(time == 2) colorPick = pink1;
  if(time == 3) colorPick = pink1;
  if(time == 4) colorPick = green3;
  if(time == 5) colorPick = green3;
  if(time == 6) colorPick = green4;
  if(time == 7) colorPick = green4;
  if(time == 8) colorPick = green5;
  if(time == 9) colorPick = green5;
  if(time == 10) colorPick = green6;
  if(time == 11) colorPick = green6;
  if(time == 12) colorPick = purple1;
  if(time == 13) colorPick = yellow1;
  if(time == 14) colorPick = orange1;
  if(time == 15) colorPick = orange1;
  if(time == 16) colorPick = orange2;
  if(time == 17) colorPick = orange2;
  if(time == 18) colorPick = red1;
  if(time == 19) colorPick = red1;
  if(time == 20) colorPick = blue1;
  if(time == 21) colorPick = blue1;
  if(time == 22) colorPick = blue2;
  if(time == 23) colorPick = blue2;
  
  return colorPick;
}

// |-- This is a subfunction of draw() --|
// Picks an icon for the weather condition
// This function returns an image accordingly to the forecast condition
PImage conditionIcon(String searchCondition){

  PImage weatherIcon = loadImage("images/close_48dp.png");
  boolean matchFound = false;
  int imageIndex = 0;

  //Weather condition list from: https://www.weatherapi.com/docs/weather_conditions.xml
  String[] weatherConditions = {
    //sunny.png
    "Sunny",
    //bedtime_48dp.png
    "Clear ",
    //partly_cloudy_day_48dp.png
    "Partly Cloudy ",
    "Partly cloudy",
    //cloud_48dp.png
    "Cloudy ",
    "Overcast ",
    //foggy_48dp.png
    "Fog",
    "Freezing fog",
    //weather_snowy_48dp.png
    "Blowing snow",
    "Blizzard",
    "Light sleet",
    "Moderate or heavy sleet",
    "Patchy light snow",
    "Light snow",
    "Patchy moderate snow",
    "Moderate snow",
    "Patchy heavy snow",
    "Heavy snow",
    "Ice pellets",
    "Light snow showers",
    "Moderate or heavy snow showers",
    "Light showers of ice pellets",
    "Moderate or heavy showers of ice pellets",
    "Moderate or heavy sleet showers",
    "Light sleet showers",
    //rainy_48dp.png
    "Mist",
    "Patchy rain nearby",
    "Patchy rain possible",
    "Patchy snow possible",
    "Patchy sleet possible",
    "Patchy freezing drizzle possible",
    "Patchy light drizzle",
    "Light drizzle",
    "Freezing drizzle",
    "Heavy freezing drizzle",
    "Patchy light rain",
    "Light rain",
    "Moderate rain at times",
    "Moderate rain",
    "Heavy rain at times",
    "Heavy rain",
    "Light freezing rain",
    "Moderate or heavy freezing rain",
    "Light rain shower",
    "Moderate or heavy rain shower",
    "Torrential rain shower",
    //bolt_48dp.png
    "Patchy light rain with thunder",
    "Thundery outbreaks possible",
    "Moderate or heavy rain with thunder",
    "Patchy light snow with thunder",
    "Moderate or heavy snow with thunder"
  };

  // Searches for a condition match among the weather conditions list
  for (int i = 0; i < weatherConditions.length; i++) {
    if (searchCondition.equals(weatherConditions[i])) {
      matchFound = true;
      imageIndex = i;
      break;
    }
  }

  // If there is not a match, the image index gets the variable lenght to display the error icon
  if (!matchFound) {
    imageIndex = weatherConditions.length;
  }

  // Accordingly to the image index the weather icon is asigned
  if(imageIndex == 0) weatherIcon = sunnyIcon;
  if(imageIndex == 1) weatherIcon = bedtimeIcon;
  if((imageIndex == 2) || (imageIndex == 3)) weatherIcon = partlyCloudDayIcon;
  if((imageIndex == 4) || (imageIndex == 5)) weatherIcon = cloudIcon;
  if((imageIndex == 6) || (imageIndex == 7)) weatherIcon = foggyIcon;
  if((imageIndex >= 8) && (imageIndex <= 24)) weatherIcon = snowyIcon;
  if((imageIndex >= 25) && (imageIndex <= 45)) weatherIcon = rainyIcon;
  if((imageIndex >= 46) && (imageIndex <= 50)) weatherIcon = boltIcon;
  if(imageIndex == 51) weatherIcon = errorIcon;

  return weatherIcon;
}
