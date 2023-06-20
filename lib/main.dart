import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sto_crm/client/client.dart';
import 'package:sto_crm/cubit/offers_cubit.dart';
import 'package:sto_crm/sid_interceptor.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  final dio = Dio()..interceptors.add(sidInterceptor);
  late final cubit = OffersCubit(client: RestClient(dio));
  late final tabs = TabController(length: 2, vsync: this);

  @override
  void initState() {
    super.initState();
    cubit.fetchOffers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: BlocProvider.value(
          value: cubit,
          child: BlocBuilder<OffersCubit, OffersState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                success: (offers) => ListView.builder(
                  itemCount: offers.length,
                  itemBuilder: (context, index) {
                    final offer = offers[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      child: Material(
                        color: Colors.white,
                        elevation: 1,
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ФИО контакта: ${offer.contactTitle}',
                              ),
                              Text(
                                'ID сделки: ${offer.offerId}',
                              ),
                              Text(
                                'Тип сделки: ${offer.offersTypeName}',
                              ),
                              Text(
                                'Название статуса: ${offer.statusName}',
                              ),
                              Text(
                                'Сумма сделки: ${offer.offerSum}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                failure: () => Center(
                  child: Column(
                    children: [
                      const Text('Ошибка'),
                      MaterialButton(
                        onPressed: () {
                          cubit.fetchOffers();
                        },
                        child: const Text('Повторить попытку'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
