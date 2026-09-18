import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets(
    'Aplicativo inicia corretamente',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MeuApp());

      expect(
        find.text('Abra o menu lateral para acessar as telas.'),
        findsOneWidget,
      );
    },
  );
}