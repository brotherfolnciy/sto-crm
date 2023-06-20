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
    cubit.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: tabs,
            tabs: const [
              Tab(
                text: 'Сделки',
              ),
              Tab(
                text: 'Статусы',
              )
            ],
          ),
        ),
        body: BlocProvider.value(
          value: cubit,
          child: BlocBuilder<OffersCubit, OffersState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                success: (offers, statuses) => TabBarView(
                  controller: tabs,
                  children: [
                    ListView.builder(
                        itemCount: offers.length,
                        itemBuilder: (context, index) {
                          final offer = offers[index];
                          return ListTile(
                            title: Text(
                              '${offer.offerFirstResponsible}',
                            ),
                            subtitle: Text(
                              'ID: ${offer.offerId}',
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: statuses.length,
                        itemBuilder: (context, index) {
                          final statusesList =
                              statuses.values.map((status) => status).toList();
                          final status = statusesList[index];
                          return ListTile(
                            title: Text(
                              '${status.title}',
                            ),
                            subtitle: Text(
                              'ID: ${status.statusId}',
                            ),
                          );
                        }),
                  ],
                ),
                failure: () => Center(
                  child: Column(
                    children: [
                      const Text('Ошибка'),
                      MaterialButton(
                        onPressed: () {
                          cubit.fetchData();
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
