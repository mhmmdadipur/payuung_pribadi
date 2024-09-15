part of 'controllers.dart';

class MainController extends GetxController {
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<String> selectedItemNavbarId = Rx<String>('home');

  final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey();

  List<CustomItemNavbar> navbarMenu = [
    CustomItemNavbar(
      id: 'home',
      label: 'Home',
      slug: Routes.home,
      selectedIcon: IconlyBold.home,
      unselectedIcon: IconlyLight.home,
    ),
    CustomItemNavbar(
      id: 'search',
      label: 'Search',
      slug: Routes.homeMaintenance,
      selectedIcon: IconlyBold.search,
      unselectedIcon: IconlyLight.search,
    ),
    CustomItemNavbar(
      id: 'cart',
      label: 'Cart',
      slug: Routes.homeMaintenance,
      selectedIcon: IconlyBold.buy,
      unselectedIcon: IconlyLight.buy,
    ),
    CustomItemNavbar(
      id: 'transaction',
      label: 'Daftar Transaksi',
      slug: Routes.homeMaintenance,
      selectedIcon: IconlyBold.buy,
      unselectedIcon: IconlyLight.buy,
    ),
    CustomItemNavbar(
      id: 'voucher',
      label: 'Voucher',
      slug: Routes.homeMaintenance,
      selectedIcon: Iconsax.receipt_25,
      unselectedIcon: Iconsax.receipt_2,
    ),
    CustomItemNavbar(
      id: 'address',
      label: 'Alamat Pengiriman',
      slug: Routes.homeMaintenance,
      selectedIcon: Iconsax.location5,
      unselectedIcon: Iconsax.location,
    ),
    CustomItemNavbar(
      id: 'friends',
      label: 'Daftar Teman',
      slug: Routes.homeMaintenance,
      selectedIcon: IconlyBold.user_3,
      unselectedIcon: IconlyLight.user_1,
    ),
  ];
}
