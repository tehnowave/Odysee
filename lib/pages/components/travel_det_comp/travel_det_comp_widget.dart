import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'travel_det_comp_model.dart';
export 'travel_det_comp_model.dart';

class TravelDetCompWidget extends StatefulWidget {
  const TravelDetCompWidget({
    super.key,
    required this.travelRef,
  });

  final DocumentReference? travelRef;

  @override
  State<TravelDetCompWidget> createState() => _TravelDetCompWidgetState();
}

class _TravelDetCompWidgetState extends State<TravelDetCompWidget> {
  late TravelDetCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TravelDetCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: StreamBuilder<TravelRecord>(
          stream: TravelRecord.getDocument(widget.travelRef!),
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

            final columnTravelRecord = snapshot.data!;

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            TravelDetailWidget.routeName,
                            queryParameters: {
                              'travelRef': serializeParam(
                                widget.travelRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Text(
                          columnTravelRecord.travelName,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RatingBar.builder(
                      onRatingUpdate: (newValue) =>
                          safeSetState(() => _model.ratingBarValue = newValue),
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: FlutterFlowTheme.of(context).warning,
                      ),
                      direction: Axis.horizontal,
                      initialRating: _model.ratingBarValue ??=
                          valueOrDefault<double>(
                        functions.averageRating(
                            columnTravelRecord.ratingList.toList()),
                        0.0,
                      ),
                      unratedColor: FlutterFlowTheme.of(context).alternate,
                      itemCount: 5,
                      itemSize: 24.0,
                      glowColor: FlutterFlowTheme.of(context).warning,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        formatNumber(
                          functions.averageRating(
                              columnTravelRecord.ratingList.toList()),
                          formatType: FormatType.custom,
                          format: '#.##',
                          locale: '',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
