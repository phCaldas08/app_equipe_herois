import 'package:nac_rm_81674/models/heroi.dart';

class HeroiRepository {
  List<Heroi> _listHerois;

  HeroiRepository._() {
    _listHerois = List<Heroi>();
    _listHerois.add(
      Heroi(
          1,
          "Homem de Ferro",
          "https://c.wallhere.com/photos/b9/e0/1920x1080_px_Blo0p_Heroes_Iron_man_minimalism_superhero-541258.jpg!d",
          "https://pausadrammatica.files.wordpress.com/2015/05/homem-de-ferro.jpg?w=350&h=618",
          0.8,
          0.6,
          0.8,
          0.7,
          false),
    );
    _listHerois.add(
      Heroi(
          2,
          "Capitão América",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTBV866f958CC3vMhwlIz0McgmYFj1chAMWjl9hFr0KzWc25K9&usqp=CAU",
          "https://i.pinimg.com/564x/df/6e/38/df6e3856a0d5920e5633276a9016f453.jpg",
          0.7,
          0.9,
          0.6,
          0.9,
          false),
    );
    _listHerois.add(
      Heroi(
          3,
          "Thor",
          "https://c.wallhere.com/photos/b2/cb/Marvel_Comics_hero_Thor_minimalism_superhero_Blo0p_blue_background_simple_background-219398.jpg!d",
          "https://i.pinimg.com/564x/ff/40/a2/ff40a20ce742d74c227e2ca14f032efe--thor-marvel-marvel-heroes.jpg",
          0.8,
          0.5,
          0.9,
          0.6,
          false),
    );
    _listHerois.add(
      Heroi(
          4,
          "Homem Aranha",
          "https://i.pinimg.com/236x/bd/a8/0f/bda80f436d0d746ac227b28d1a273764--marvel-wallpapers.jpg",
          "https://i.pinimg.com/564x/a0/d0/dd/a0d0dddf2c42df344f2bbfcb4d43ae62.jpg",
          0.6,
          0.9,
          0.7,
          0.8,
          false),
    );
    _listHerois.add(
      Heroi(
          5,
          "Hulk",
          "https://i.pinimg.com/236x/78/c0/63/78c063c8cd712f6d3218cb03c4d5e7f9--hulk-poster-poster-marvel.jpg",
          "https://pausadrammatica.files.wordpress.com/2015/05/hulk.jpg?w=349&h=616",
          0.9,
          0.3,
          0.7,
          0.6,
          false),
    );
    _listHerois.add(
      Heroi(
          6,
          "Wolverine",
          "https://mcdn.wallpapersafari.com/medium/16/76/6bJSFN.jpg",
          "https://i.pinimg.com/564x/04/cd/59/04cd5923e81e18e40943beda6679f0b6.jpg",
          0.8,
          0.8,
          0.7,
          0.7,
          false),
    );
     _listHerois.add(
      Heroi(
          6,
          "Homem Formiga",
          "https://c4.wallpaperflare.com/wallpaper/969/175/648/ant-blo0p-heroes-man-wallpaper-preview.jpg",
          "https://i.pinimg.com/736x/47/29/da/4729da0aac97d630c7553e061ab9558b.jpg",
          0.8,
          0.8,
          0.7,
          0.7,
          false),
    );
      _listHerois.add(
      Heroi(
          7,
          "Gavião Arqueiro",
          "https://i.pinimg.com/236x/c5/8e/af/c58eaf241e07e1cd8bb60bb5d6a570d8.jpg",
          "https://i.pinimg.com/564x/a9/a9/59/a9a9592480025ed046c88120d938ab29.jpg",
          0.6,
          0.8,
          0.5,
          0.7,
          false),
    );
  }

  static HeroiRepository _instance;

  static HeroiRepository getInstance() {
    if (_instance == null) _instance = HeroiRepository._();

    return _instance;
  }

  List<Heroi> findAll() {
    return _listHerois;
  }

  Heroi findById(int id) {
    return _listHerois.where((heroi) => heroi.id == id).first;
  }

  Future<List<Heroi>> findAllAsync() async {
    return Future.delayed(Duration(milliseconds: 500), () => _listHerois);
  }

  Future<List<Heroi>> findQueryAsync(bool Function(Heroi) query) async {
    return Future.delayed(Duration(milliseconds: 500), () => _listHerois.where(query)?.toList());
  }
}
