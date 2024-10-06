String imagePlanet(String name) {
  switch (name) {
    case "Mercury":
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Mercury_in_true_color.jpg/1024px-Mercury_in_true_color.jpg";
    case "Venus":
      return "https://upload.wikimedia.org/wikipedia/commons/c/c7/PIA23791-Venus-RealAndEnhancedContrastViews-20200608_%28cropped%29.jpg";
    case "Earth":
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/The_Blue_Marble_%28remastered%29.jpg/1200px-The_Blue_Marble_%28remastered%29.jpg";
    case "Mars":
      return "https://upload.wikimedia.org/wikipedia/commons/0/0c/Mars_-_August_30_2021_-_Flickr_-_Kevin_M._Gill.png";
    case "Jupiter":
      return "https://upload.wikimedia.org/wikipedia/commons/7/71/PIA22946-Jupiter-RedSpot-JunoSpacecraft-20190212.jpg";
    case "Saturn":
      return "https://upload.wikimedia.org/wikipedia/commons/c/c7/Saturn_during_Equinox.jpg";
    case "Uranus":
      return "https://upload.wikimedia.org/wikipedia/commons/6/69/Uranus_Voyager2_color_calibrated.png";
    case "Neptune":
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Neptune_Voyager2_color_calibrated.png/800px-Neptune_Voyager2_color_calibrated.png";
    default:
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Solar_System_true_color.jpg/800px-Solar_System_true_color.jpg";
  }
}
