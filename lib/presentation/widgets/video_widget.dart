import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String? url;
  const VideoWidget({
    super.key,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 180,
          child: Image.network(
            url ?? '',
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext _, Widget child,ImageChunkEvent? progress){
               if(progress == null){
                return child;
               } else {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2,),
                );
               }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
               return const Center(child: Icon(Icons.wifi,color: Colors.grey,));
            } ,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              radius: 22,
              backgroundColor: kBlackColor.withOpacity(0.5),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    size: 20,
                  ))),
        ),
      ],
    );
  }
}
