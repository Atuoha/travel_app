import 'package:flutter/foundation.dart';
import '../model/travel.dart';

class TravelData extends ChangeNotifier {
  //List of travel items
  static List<Travel> getTravelItems() {
    final List<Travel> _travelList = [
      Travel(
          'Magic Tower',
          4,
          'The building where the heights meets the golden touches',
          'Cairo, Egypt',
          4.6,
          3,
          ['assets/images/img1.jpg', 'assets/images/thumbnail1.png'],
          230),
      Travel(
          'Dubai Burg',
          5,
          'Built on top of a man-made island, this building is a masterpiece',
          'Dubai, UAE',
          4.3,
          6,
          ['assets/images/img2.jpg', 'assets/images/thumbnail2.png'],
          432),
      Travel(
          'Arc Bridge',
          3,
          'Visit and experience the magic of the oldest arc bridge in the world',
          'Rhodes, Greece',
          4.5,
          8,
          ['assets/images/img3.jpg', 'assets/images/thumbnail3.png'],
          283),
      Travel(
          'Magic Beaches',
          3,
          'Do you have a taste for beaches, and camels. Magic Sandy Beaches is for you',
          'Santo, Vanuatu',
          4.2,
          16,
          ['assets/images/img4.jpg', 'assets/images/thumbnail4.png'],
          389),
      Travel(
          'Blue Nature',
          2,
          'The beach offers senernity and deep connection to the mother nature',
          'Ayia, Cyprus',
          4.8,
          21,
          ['assets/images/img5.jpg', 'assets/images/thumbnail5.png'],
          534),
    ];
    return _travelList;
  }

//Get the nearest list items (Those whose distance is less than 10kms
  static List<Travel> getNearestItems() {
    List<Travel> _travelList = getTravelItems();
    return _travelList.where((element) => element.distance < 10).toList();
  }

  
}
