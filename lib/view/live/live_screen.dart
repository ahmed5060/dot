import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../bloc/cubit.dart';
import '../../bloc/state.dart';
import '../../models/SettingsModel.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as html;

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {

  SettingsModel? settingsModel;

  YoutubePlayerController? _controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..GetSettings(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {
          if(state is GetSettingsSuccessState){
            settingsModel = state.settingsModel;
            String? extractSrcFromIframe(String htmlString) {
              final document = htmlParser.parse(htmlString);
              final iframeElement = document.querySelector('iframe');

              if (iframeElement != null) {
                final srcAttribute = iframeElement.attributes['src'];
                return srcAttribute;
              }

              return null; // Return null if no iframe tag is found
            }
            _controller = YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(extractSrcFromIframe(state.settingsModel.livechat!)!)!,
              flags: const YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
              ),
            );
          }
        },
        builder: (BuildContext context, state) =>Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_forward_ios, color: Colors.black,))
            ],
            leading: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            title: Text("البث المباشر", style: TextStyle(color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.w600),),
          ),
          body: ConditionalBuilder(
            condition: state is GetSettingsSuccessState,
            fallback: (context) => const Center(child: CircularProgressIndicator()),
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                YoutubePlayer(
                  controller: _controller!,
                  showVideoProgressIndicator: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
