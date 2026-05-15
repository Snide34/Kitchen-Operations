import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewmodels/schedule_viewmodel.dart';
import '../../widgets/common/app_header.dart';
import '../../widgets/common/app_tabs.dart';
import '../../widgets/common/bottom_nav.dart';
import '../../widgets/schedule/timeline_header.dart';
import '../../widgets/schedule/buffet_slot_widget.dart';
import '../../widgets/schedule/left_label.dart';
import '../../widgets/schedule/shift_card.dart';
import '../live_orders/live_orders_view.dart';
import '../shelf_life/shelf_life_view.dart';
import '../breakfast_menu/breakfast_menu_view.dart';
import '../../models/buffet_slot.dart';
import '../../core/constants/app_colors.dart';

class ScheduleView extends GetView<ScheduleViewModel> {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.selectedBottomNav.value != 3) {
            return _buildPlaceholder(controller.selectedBottomNav.value);
          }
          
          return Column(
            children: [
              const AppHeader(title: 'Kitchen Operations'),
              AppTabs(
                tabs: controller.tabs,
                selectedIndex: controller.selectedTab.value,
                onTap: controller.changeTab,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: _buildBody(),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: Obx(() => BottomNav(
        selectedIndex: controller.selectedBottomNav.value,
        onTap: controller.changeBottomNav,
      )),
    );
  }

  Widget _buildPlaceholder(int index) {
    final titles = ['Dashboard', 'Take Orders', 'Prepare Order'];
    return Center(
      child: Text(
        '${titles[index]}\nComing Soon',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: AppColors.textSecondary),
      ),
    );
  }

  Widget _buildBody() {
    switch (controller.selectedTab.value) {
      case 0:
        return _buildScheduleContent();
      case 1:
        return const LiveOrdersView();
      case 2:
        return const ShelfLifeView();
      case 3:
        return const BreakfastMenuView();
      default:
        return _buildScheduleContent();
    }
  }

  Widget _buildScheduleContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLeftColumn(),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimelineHeader(hours: controller.hours),
                  _buildBuffetGrid(),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.shifts.map((shift) => ShiftCard(shift: shift)).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      children: [
        const SizedBox(height: 60),
        const LeftLabel(title: 'Guest\nBuffet', link: 'Guest List'),
        const LeftLabel(title: 'Event\nBuffet', link: 'Details'),
      ],
    );
  }

  Widget _buildBuffetGrid() {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: AppColors.borderLight),
                        bottom: BorderSide(color: AppColors.borderLight),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Break Fast',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: const [
                        BuffetSlotWidget(
                          slot: BuffetSlot(
                            label: 'Preparation Time',
                            time: '6:50 AM - 8:30 AM',
                            link: 'Menu',
                          ),
                        ),
                        BuffetSlotWidget(
                          slot: BuffetSlot(
                            label: 'Serve Time',
                            time: '8:30 AM - 11:00 AM',
                            link: 'Live Counter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: AppColors.borderLight),
                        bottom: BorderSide(color: AppColors.borderLight),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Lunch',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: const [
                        BuffetSlotWidget(
                          slot: BuffetSlot(
                            label: 'Preparation Time',
                            time: '11:05 AM - 12:30 PM',
                            link: 'Menu',
                          ),
                        ),
                        BuffetSlotWidget(
                          slot: BuffetSlot(
                            label: 'Serve Time',
                            time: '12:30 PM - 03:00 PM',
                            link: 'Live Counter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: AppColors.borderLight),
                        bottom: BorderSide(color: AppColors.borderLight),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Dinner',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: const [
                        BuffetSlotWidget(
                          slot: BuffetSlot(
                            label: 'Preparation Time',
                            time: '05:50 PM - 07:30 PM',
                            link: 'Menu',
                          ),
                        ),
                        BuffetSlotWidget(
                          slot: BuffetSlot(
                            label: 'Serve Time',
                            time: '07:30 PM - 10:00 PM',
                            link: 'Live Counter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BuffetSlotWidget(slot: BuffetSlot()),
              const BuffetSlotWidget(slot: BuffetSlot(isNA: true)),
              Column(
                children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: AppColors.borderLight),
                        bottom: BorderSide(color: AppColors.borderLight),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Lunch',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: const [
                        BuffetSlotWidget(
                          slot: BuffetSlot(
                            eventName: 'Event Name 1',
                            label: 'Preparation Time',
                            time: '10:50 AM - 12:00 PM',
                            link: 'Menu',
                          ),
                        ),
                        BuffetSlotWidget(
                          slot: BuffetSlot(
                            eventName: 'Event Name 1',
                            label: 'Serve Time',
                            time: '12:00 PM - 2:30 PM',
                            link: 'Live Counter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 280,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: AppColors.borderLight),
                        bottom: BorderSide(color: AppColors.borderLight),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Dinner',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: const [
                        BuffetSlotWidget(
                          slot: BuffetSlot(
                            eventName: 'Event Name 2',
                            label: 'Preparation Time',
                            time: '5:00 PM - 7:00 PM',
                            link: 'Menu',
                          ),
                        ),
                        BuffetSlotWidget(
                          slot: BuffetSlot(
                            eventName: 'Event Name 2',
                            label: 'Serve Time',
                            time: '7:00 PM - 9:30 PM',
                            link: 'Live Counter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
