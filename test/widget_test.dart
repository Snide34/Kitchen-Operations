import 'package:flutter_test/flutter_test.dart';
import 'package:kitchenoperations/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const KitchenOperationsApp());

    expect(find.text('Kitchen Operations'), findsOneWidget);
  });
}
