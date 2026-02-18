import 'package:flutter_test/flutter_test.dart';
import 'package:wastella_undian_11/main.dart';
import 'package:wastella_undian_11/features/home/home_screen.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const WasteMateApp());

    expect(find.byType(HomeScreen), findsOneWidget);

    expect(find.text('Hello, WasteMate'), findsOneWidget);
    expect(find.text('500'), findsOneWidget);
  });
}
