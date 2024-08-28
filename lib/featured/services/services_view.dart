import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/custom_drawer.dart';
import 'cubit/service_cubit.dart';
import 'widgets/services_body.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: BlocBuilder<ServiceCubit, ServiceState>(
        bloc: serviceCubit..getServices(),
        builder: (context, state) {
          if (state is ServiceLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ServiceErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return const ServicesBody();
        },
      ),
    );
  }
}
