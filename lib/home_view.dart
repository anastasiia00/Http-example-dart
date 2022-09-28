import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/blocs/app_blocs.dart';
import 'package:project/blocs/app_events.dart';
import 'package:project/blocs/app_state.dart';
import 'package:project/detail_view.dart';
import 'package:project/models/user_model.dart';
import 'package:project/repository/repository.dart';
import 'package:project/widgets/user_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(RepositoryProvider.of<UserRepoitory>(context))
            ..add(LoadUserEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Http Get Example',
          ),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<UserModel> userList = state.user;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
                child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: ((_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: InkWell(
                          onTap: () {
                            // PageTransition(
                            //   child: DetailView(element: userList[index]),
                            //   type: PageTransitionType.rightToLeft,
                            // );
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              // return PageTransition(child: DetailView(element: userList[index], type: PageTransitionType.fade,),
                              return DetailView(element: userList[index]);
                            }));
                          },
                          child: UserItem(
                            avatar: userList[index].avatar,
                            firstName: userList[index].firstName,
                            lastName: userList[index].lastName,
                          ),
                        ),
                      );
                    })),
              );
            }

            if (state is UserErrorState) {
              return Center(
                child: Container(
                  height: 400,
                  child: Column(
                    children: [
                      Image.network(
                        'https://cdn.dribbble.com/users/2624304/screenshots/7142781/media/0121d5720b6cc0bbf06f3d2aed4d913a.jpeg?compress=1&resize=400x300',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 26,
                          right: 26,
                          top: 42,
                        ),
                        child: Text(
                          'Sorry, this page has some troubles! Please, waite a minute, or reload app.',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
