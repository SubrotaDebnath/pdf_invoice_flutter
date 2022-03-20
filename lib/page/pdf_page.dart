import 'package:flutter/material.dart';
import 'package:pdf_invoice_flutter/api/pdf_api.dart';
import 'package:pdf_invoice_flutter/api/pdf_invoice_api.dart';
import 'package:pdf_invoice_flutter/model/customer.dart';
import 'package:pdf_invoice_flutter/model/invoice.dart';
import 'package:pdf_invoice_flutter/model/supplier.dart';
import 'package:pdf_invoice_flutter/widget/button_widget.dart';


class PdfPage extends StatefulWidget {
  const PdfPage({Key? key}) : super(key: key);

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      title: const Text(''),
      centerTitle: true,
    ),
    body: Container(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const TitleWidget(
            //   icon: Icons.picture_as_pdf,
            //   text: 'Generate Invoice',
            // ),
            const SizedBox(height: 48),
            ButtonWidget(
              text: 'Invoice PDF',
              onClicked: () async {
                final date = DateTime.now();
                final dueDate = date.add(const Duration(days: 7));

                final invoice = Invoice(
                  supplier:const Supplier(
                    name: 'WashUp',
                    address: 'Gulshan,Dhaka, Bangladesh',
                    paymentInfo: 'https://test.payment.snackeeper.xyz/payment.php',
                  ),
                  customer:const Customer(
                    name: 'Subrota Debnath',
                    address: 'Dhanmondi, Dhaka, Bangladesh',
                  ),
                  info: InvoiceInfo(
                    date: date,
                    dueDate: dueDate,
                    description: 'My description...',
                    number: '${DateTime.now().year}-9999',
                  ),
                  items: [
                    InvoiceItem(
                      description: 'Shirt',
                      date: DateTime.now(),
                      quantity: 3,
                      vat: 0.15,
                      unitPrice: 85.00,
                    ),
                    InvoiceItem(
                      description: 'Pant',
                      date: DateTime.now(),
                      quantity: 8,
                      vat: 0.15,
                      unitPrice: 90.00,
                    ),
                    InvoiceItem(
                      description: 'Blanket',
                      date: DateTime.now(),
                      quantity: 3,
                      vat: 0.20,
                      unitPrice: 300.00,
                    ),
                    // InvoiceItem(
                    //   description: 'Apple',
                    //   date: DateTime.now(),
                    //   quantity: 8,
                    //   vat: 0.19,
                    //   unitPrice: 3.99,
                    // ),
                    // InvoiceItem(
                    //   description: 'Mango',
                    //   date: DateTime.now(),
                    //   quantity: 1,
                    //   vat: 0.19,
                    //   unitPrice: 1.59,
                    // ),
                    // InvoiceItem(
                    //   description: 'Blue Berries',
                    //   date: DateTime.now(),
                    //   quantity: 5,
                    //   vat: 0.19,
                    //   unitPrice: 0.99,
                    // ),
                    // InvoiceItem(
                    //   description: 'Lemon',
                    //   date: DateTime.now(),
                    //   quantity: 4,
                    //   vat: 0.19,
                    //   unitPrice: 1.29,
                    // ),



                  ],
                );

                final pdfFile = await PdfInvoiceApi.generate(invoice);

                PdfApi.openFile(pdfFile);
              },
            ),
          ],
        ),
      ),
    ),
  );
}