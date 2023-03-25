import 'package:hive/hive.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';

import '../../data/vos/cities_vo.dart';

class CitiesDao
{
  static final CitiesDao _singleton = CitiesDao._internal();

  factory CitiesDao() {
    return _singleton;
  }

  CitiesDao._internal();

  void saveAllCities(List<CitiesVO> cities) async{
    Map<int,CitiesVO> citiesMap = Map.fromIterable(cities,
        key: (city) => city.id, value: (city) => city);
    return await getCityBox().putAll(citiesMap);
  }

  List<CitiesVO> getAllCities() {
    return getCityBox().values.toList();
  }

  Box<CitiesVO> getCityBox() {
    return Hive.box<CitiesVO>(BOX_NAME_CITY_VO);
  }
}