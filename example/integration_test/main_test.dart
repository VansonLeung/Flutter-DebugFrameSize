import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      expect(find.text('280px x 20px'), findsOneWidget);
      expect(find.text('240px x 20px'), findsOneWidget);
      expect(find.text('130px x 20px'), findsOneWidget);
      expect(find.text('30px x 60px'), findsOneWidget);
      expect(find.text('3 x 3'), findsNothing);

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Increment');
      expect(fab, findsOneWidget);

      // Verify the counter increments by 1,2,4,8,16,etc...
      var m = 0;
      for (var k = 0; k < 10; k += 1) {
        m = m <= 0 ? 1 : m;
        m *= 2;
        await xtap(tester, fab, () {
          expect(find.text("${m}"), findsOneWidget);
        });
      }

      // Finds the floating action button to tap on.
      final Finder ftd = find.byTooltip('Toggle Debug');
      await xtap(tester, ftd, null);

      expect(find.text('280px x 20px'), findsNothing);
      expect(find.text('240px x 20px'), findsNothing);
      expect(find.text('130px x 20px'), findsNothing);
      expect(find.text('30px x 60px'), findsNothing);
      expect(find.text('3 x 3'), findsNothing);

      await xtap(tester, ftd, null);

      expect(find.text('280px x 20px'), findsOneWidget);
      expect(find.text('240px x 20px'), findsOneWidget);
      expect(find.text('130px x 20px'), findsOneWidget);
      expect(find.text('30px x 60px'), findsOneWidget);
      expect(find.text('3 x 3'), findsNothing);
    });
  });
}

Future xtap(WidgetTester tester, Finder fab, Function? callback) async {
  await tester.tap(fab);
  await tester.pumpAndSettle();
  callback?.call();
  return true;
}
