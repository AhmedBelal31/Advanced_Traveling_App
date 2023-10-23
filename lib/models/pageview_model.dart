class PageViewModel
{
  final String image ;
  final String subTitle ;
  PageViewModel({required this.image , required this.subTitle});
}
List<PageViewModel> pageViewScreens = [
  PageViewModel(
      image: 'assets/images/welcome-one.png' ,
      subTitle: 'Mountain hikes give you an increible sense of freedom along with endurance test'

  ),
  PageViewModel(
      image: 'assets/images/welcome-two.png' ,
      subTitle: 'Gives you a taste of the canada mountains , from Horseshoe Bay in the north of vancouver to pemberton . '
  ),
  PageViewModel(
      image: 'assets/images/welcome-three.png' ,
      subTitle: "The Icefields Parkway offers you the picturesque panorama Of Alberta's most talked about mountain vistas.  "
  ),
];