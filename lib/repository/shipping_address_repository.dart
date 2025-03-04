import 'package:e_commerce_modernui/model/address.dart';

class ShippingAddressRepository {
  List<Address> getShippingAddress() {
    return [
      Address(
        id: '1',
        label: 'Home',
        fullAddress: 'Lahan Municipality Ward No. 8, Apt 8',
        city: "Lahan",
        state: "Madhesh",
        zipCode: "56500",
        isDefault: true,
        type: AddressType.home,
      ),
      Address(
        id: '1',
        label: 'Office',
        fullAddress: 'Kathmandu Metro-politiancity Ward No. 28, Apt 18',
        city: "Koteshwor",
        state: "Bagmati",
        zipCode: "44600",
        type: AddressType.office,
      ),
    ];
  }

  Address? getDefaultAddress() {
    return getShippingAddress().firstWhere((address) => address.isDefault,
        orElse: () => getShippingAddress().first);
  }
}
