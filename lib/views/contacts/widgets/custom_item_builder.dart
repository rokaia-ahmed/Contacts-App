import 'package:contact_app/core/routs/app_routs.dart';
import 'package:contact_app/view_model/cubit/contact_cubit.dart';
import 'package:contact_app/view_model/cubit/contact_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/helper/lunch_url.dart';

class CustomItemBuilder extends StatelessWidget {
  const CustomItemBuilder({super.key,
    required this.model});

  final Map<String, dynamic> model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListTile(
        leading: CircleAvatar(
          radius: 15,
          backgroundColor: AppColors.primaryColor,
          child: Text('${model['name']}'[0].toUpperCase()),
        ),
        minLeadingWidth: 10,
        title: Text('${model['name']}',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text('${model['phone']}',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        trailing: BlocConsumer<ContactCubit, ContactStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ContactCubit.get(context);
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: (){
                    launchURL(model['phone']);
                  },
                  child: const Icon(Icons.phone),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context,Routes.addContact,
                        arguments:ScreenArgument(true,
                        model: model,
                        ),
                    );
                  },
                  child: const Icon(Icons.edit),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    cubit.deleteDatabase(id:model['id']);
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
