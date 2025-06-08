import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'launch_a_model.dart';
export 'launch_a_model.dart';

class LaunchAWidget extends StatefulWidget {
  const LaunchAWidget({super.key});

  static String routeName = 'LaunchA';
  static String routePath = '/launchA';

  @override
  State<LaunchAWidget> createState() => _LaunchAWidgetState();
}

class _LaunchAWidgetState extends State<LaunchAWidget> {
  late LaunchAModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LaunchAModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2000));

      context.pushNamed(LaunchBWidget.routeName);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).mainGreen,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Gemini_Generated_Image_wt7hwhwt7hwhwt7h-removebg-preview.png',
                width: 416.7,
                height: 218.99,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
