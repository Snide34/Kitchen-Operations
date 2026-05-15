# Kitchen Operations

A comprehensive Flutter application for managing kitchen operations, including scheduling, live orders, shelf life tracking, and menu management.

## 📌 Overview
Kitchen Operations is a mobile application designed to streamline restaurant and hotel kitchen management with real-time order tracking, staff scheduling, inventory management, and menu planning capabilities.

## Key Features
- **Schedule Management**: Visual timeline for staff shifts and buffet planning
- **Live Orders**: Real-time order tracking with assignment and status management
- **Shelf Life Tracking**: Monitor inventory freshness and expiration dates
- **Menu Planning**: Manage breakfast menu quantities and requirements
- **Responsive Design**: Optimized for mobile devices with intuitive navigation

---

## 🚀 Technology Stack

- **Framework**: Flutter (Latest Stable)
- **Language**: Dart
- **Architecture**: MVVM (Model-View-ViewModel)
- **State Management**: GetX
- **UI Components**: Custom reusable widgets
- **Fonts**: Google Fonts (Inter)

---

## 📱 Application Features

### 1. Schedule Management
- Visual timeline with hourly slots
- Staff shift tracking with color-coded indicators
- Buffet planning (Guest & Event)
- Meal preparation and serving time management

### 2. Live Orders
- Real-time order status tracking
- Room-based order organization
- Staff assignment functionality
- Individual item cancellation
- Timer for order preparation

### 3. Shelf Life Items
- Inventory tracking with expiration monitoring
- Storage location management
- Preservation method tracking
- Discount offer generation
- Watchlist management

### 4. Menu Planning
- Breakfast menu quantity management
- Available vs Required quantity tracking
- Staff update tracking
- Editable quantity inputs with units (kg/Pieces)

---

## 🧱 Architecture

This project follows the **MVVM (Model-View-ViewModel)** architecture pattern with GetX for state management.

### Project Structure

```bash
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   └── app_text_styles.dart
│   
├── models/
│   ├── buffet_slot.dart
│   ├── shift.dart
│   ├── order_model.dart
│   ├── shelf_item.dart
│   └── menu_item.dart
│
├── views/
│   ├── schedule/
│   ├── live_orders/
│   ├── shelf_life/
│   └── breakfast_menu/
│
├── viewmodels/
│   ├── schedule_viewmodel.dart
│   ├── live_orders_viewmodel.dart
│   ├── shelf_life_viewmodel.dart
│   └── breakfast_menu_viewmodel.dart
│
├── widgets/
│   ├── common/
│   ├── schedule/
│   └── shelf_life/
│
└── main.dart
```

### Reusable Components

The application includes the following reusable widgets:

- **AppHeader**: Consistent header across all screens
- **AppTabs**: Custom tab navigation with active state
- **BottomNav**: Bottom navigation bar
- **TimelineHeader**: Hourly timeline display
- **BuffetSlotWidget**: Flexible buffet slot display
- **ShiftCard**: Color-coded staff shift cards
- **LeftLabel**: Side labels for schedule rows
- **ShelfTableHeader**: Table header for inventory
- **ShelfItemRow**: Individual inventory item row
- **DateBadge**: Date display component