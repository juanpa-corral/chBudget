import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_account_form_widget.dart';
import '/components/add_new_advisement_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'accounts_model.dart';
export 'accounts_model.dart';

class AccountsWidget extends StatefulWidget {
  const AccountsWidget({super.key});

  static String routeName = 'Accounts';
  static String routePath = '/accounts';

  @override
  State<AccountsWidget> createState() => _AccountsWidgetState();
}

class _AccountsWidgetState extends State<AccountsWidget> {
  late AccountsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountsModel());

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
        backgroundColor:
            FlutterFlowTheme.of(context).backgroundDarkModeAndLetters,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '5ya7t5xn' /* Accounts */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context)
                            .backgroundGreenWhiteAndLetters,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      height: 553.0,
                      child: StreamBuilder<List<CardsRecord>>(
                        stream: queryCardsRecord(
                          queryBuilder: (cardsRecord) => cardsRecord
                              .where(
                                'owner_id',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'is_active',
                                isEqualTo: true,
                              ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<CardsRecord> swipeableStackCardsRecordList =
                              snapshot.data!;
                          if (swipeableStackCardsRecordList.isEmpty) {
                            return AddNewAdvisementWidget();
                          }

                          return FlutterFlowSwipeableStack(
                            onSwipeFn: (index) {},
                            onLeftSwipe: (index) {},
                            onRightSwipe: (index) {},
                            onUpSwipe: (index) {},
                            onDownSwipe: (index) {},
                            itemBuilder: (context, swipeableStackIndex) {
                              final swipeableStackCardsRecord =
                                  swipeableStackCardsRecordList[
                                      swipeableStackIndex];
                              return Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context)
                                          .darkModeGreenBar,
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground
                                    ],
                                    stops: [0.0, 0.5],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (swipeableStackCardsRecord
                                                  .network ==
                                              'Visa') {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/VISA-Logo-768x432.png',
                                                width: 158.1,
                                                height: 95.0,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            );
                                          } else if (swipeableStackCardsRecord
                                                  .network ==
                                              'Mastercard') {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/logo-Mastercard-640x360.png',
                                                width: 158.1,
                                                height: 95.0,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            );
                                          } else if (swipeableStackCardsRecord
                                                  .network ==
                                              'American Express') {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/american-express-logo-png_seeklogo-168631.png',
                                                width: 140.0,
                                                height: 115.0,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            );
                                          } else if (swipeableStackCardsRecord
                                                  .network ==
                                              'Diners Club') {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/diners-club-logo.png',
                                                width: 158.1,
                                                height: 95.0,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            );
                                          } else if (swipeableStackCardsRecord
                                                  .network ==
                                              'Discover') {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/discover_payment_method_icon_142757.png',
                                                width: 158.1,
                                                height: 95.0,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            );
                                          } else {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/bank.png',
                                                width: 165.9,
                                                height: 102.0,
                                                fit: BoxFit.scaleDown,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 40.0),
                                        child: Text(
                                          swipeableStackCardsRecord.type ==
                                                  'Bank Account'
                                              ? 'Bank Account'
                                              : swipeableStackCardsRecord
                                                  .network,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        swipeableStackCardsRecord.cardAlias,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        swipeableStackCardsRecord.type ==
                                                'Bank Account'
                                            ? ''
                                            : '****  ****  ****  ${swipeableStackCardsRecord.las4Digits}',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 20.0),
                                        child: Text(
                                          () {
                                            if (swipeableStackCardsRecord
                                                    .type ==
                                                'Bank Account') {
                                              return 'Personal Bank Account';
                                            } else if (swipeableStackCardsRecord
                                                    .isPersonal ==
                                                true) {
                                              return 'Personal Card/Bank Acount';
                                            } else {
                                              return 'Familiar Card';
                                            }
                                          }(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      if (swipeableStackCardsRecord.type !=
                                          'Bank Account')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/chip.png',
                                              width: 68.85,
                                              height: 59.0,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: swipeableStackCardsRecordList.length,
                            controller: _model.swipeableStackController,
                            loop: true,
                            cardDisplayCount: 3,
                            scale: 0.95,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: AddAccountFormWidget(),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  text: FFLocalizations.of(context).getText(
                    'e9meh3qq' /* Add Card / Bank Account */,
                  ),
                  icon: Icon(
                    Icons.add,
                    size: 20.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconColor: FlutterFlowTheme.of(context).lettersAndIcons,
                    color: FlutterFlowTheme.of(context).lightBlueButton,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).lettersAndIcons,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
