import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import '../../core/colors/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [const Section1(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor1,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppbarWidget(title: 'Downloads')),
        body: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 28,
                ),
            itemCount: _widgetList.length));
  }
}

class Section1 extends StatelessWidget {
  const Section1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        const Text(
          'Smart Downloads',
        )
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Center(
            child: Text(
          'Introducing Downloads for You',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )),
        kHeight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(color: kGreyColor, fontSize: 14),
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
                width: size.width,
                height: size.width,
                child: state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.grey,
                      ))
                    : (state.downloads != null && state.downloads!.isNotEmpty)
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: size.width * 0.4,
                                  backgroundColor: kGreyColor.withOpacity(0.5),
                                ),
                              ),
                              DownloadsImageWidget(
                                imageList:
                                    '$imageAppendUrl${state.downloads![0].posterPath}',
                                margin: const EdgeInsets.only(
                                    left: 130, bottom: 30),
                                angle: 20,
                                size:
                                    Size(size.width * 0.45, size.width * 0.55),
                              ),
                              DownloadsImageWidget(
                                imageList:
                                    '$imageAppendUrl${state.downloads![1].posterPath}',
                                margin: const EdgeInsets.only(
                                    right: 130, bottom: 30),
                                angle: -20,
                                size:
                                    Size(size.width * 0.45, size.width * 0.55),
                              ),
                              DownloadsImageWidget(
                                imageList:
                                    '$imageAppendUrl${state.downloads![2].posterPath}',
                                margin: const EdgeInsets.only(bottom: 0),
                                size:
                                    Size(size.width * 0.45, size.width * 0.64),
                              )
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: Colors.grey,
                          )));
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kBottonBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtonWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See What You Can Download',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 8,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageList))),
      ),
    );
  }
}
