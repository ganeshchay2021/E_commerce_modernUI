import 'package:e_commerce_modernui/repository/shipping_address_repository.dart';
import 'package:e_commerce_modernui/utils/app_text_styles.dart';
import 'package:e_commerce_modernui/widgets/custom_iconbutton.dart';
import 'package:e_commerce_modernui/widgets/custom_textfield.dart';
import 'package:e_commerce_modernui/widgets/shipping_address_card.dart';
import 'package:flutter/material.dart';

class ShippingAddressScreen extends StatelessWidget {
  final ShippingAddressRepository _repository = ShippingAddressRepository();
  ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final TextEditingController labelController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: CustomIconbutton(
          icon: Icons.arrow_back_ios,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Shipping Address",
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showAddressBottomSheet(context, labelController, "Add New Address", "Add Address");
            },
            icon: const Icon(Icons.add_circle_outline),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _repository.getShippingAddress().length,
        itemBuilder: (context, index) {
          final address = _repository.getShippingAddress()[index];
          return ShippingAddressCard(
            address: address,
            onEdit: () {
              _showAddressBottomSheet(context, labelController, "Update Your Address", "Update Address");
            },
            onDelete: () {
              _showDeleteComfirmDialog(context);
            },
          );
        },
      ),
    );
  }

  //delete confirm dialog box
  void _showDeleteComfirmDialog(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      barrierColor: Colors.black54,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red[400]!.withOpacity(0.1)),
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red[400],
                  size: 32,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Delete Address",
                style: AppTextstyles.withColor(
                  AppTextstyles.h3,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Are you sure you want to delete this address?",
                textAlign: TextAlign.center,
                style: AppTextstyles.withColor(
                  AppTextstyles.bodyMedium,
                  isDark ? Colors.grey[300]! : Colors.grey[700]!,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        "Cancel",
                        style: AppTextstyles.withColor(
                          AppTextstyles.buttonMedium,
                          isDark ? Colors.grey[300]! : Colors.grey[700]!,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Theme.of(context).primaryColor),
                      child: Text(
                        "Remove",
                        style: AppTextstyles.withColor(
                            AppTextstyles.buttonMedium, Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  //edit address bottom sheet
  void _showAddressBottomSheet(
      BuildContext context, TextEditingController labelController, String label, String btnName) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: AppTextstyles.withColor(
                      AppTextstyles.h3,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                iconColor: Theme.of(context).primaryColor,
                icon: Icons.label_outline,
                textEditingController: labelController,
                hintText: "Label (ex. Home, Office..)",
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                iconColor: Theme.of(context).primaryColor,
                icon: Icons.location_on,
                textEditingController: labelController,
                hintText: "Full Address",
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextfield(
                iconColor: Theme.of(context).primaryColor,
                icon: Icons.location_city,
                textEditingController: labelController,
                hintText: "City",
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      iconColor: Theme.of(context).primaryColor,
                      icon: Icons.map_outlined,
                      textEditingController: labelController,
                      hintText: "State",
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CustomTextfield(
                      iconColor: Theme.of(context).primaryColor,
                      icon: Icons.pin_outlined,
                      textEditingController: labelController,
                      hintText: "ZIP Code",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text(
                    btnName,
                    style: AppTextstyles.withColor(
                      AppTextstyles.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
