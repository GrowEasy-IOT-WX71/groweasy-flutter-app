import 'package:flutter/material.dart';
import '../widgets/subscription_card_widget.dart';

class SubscriptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SUSCRIPCIONES'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SUSCRIPCIONES',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  SubscriptionCard(
                    title: 'Plan Básico',
                    price: 's/. 10 mes',
                    imagePath: 'assets/images/plans/basic.jpg',
                  ),
                  SizedBox(height: 16),
                  SubscriptionCard(
                    title: 'Plan Standard',
                    price: 's/. 30 mes',
                    imagePath: 'assets/images/plans/standar.jpg',
                  ),
                  SizedBox(height: 16),
                  SubscriptionCard(
                    title: 'Plan Premium',
                    price: 's/. 80 mes',
                    imagePath: 'assets/images/plans/premiun.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
