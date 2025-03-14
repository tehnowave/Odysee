import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_favorite_list_model.dart';
export 'empty_favorite_list_model.dart';

class EmptyFavoriteListWidget extends StatefulWidget {
  const EmptyFavoriteListWidget({super.key});

  @override
  State<EmptyFavoriteListWidget> createState() =>
      _EmptyFavoriteListWidgetState();
}

class _EmptyFavoriteListWidgetState extends State<EmptyFavoriteListWidget> {
  late EmptyFavoriteListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyFavoriteListModel());
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
      ),
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
              child: Text(
                'Favorite list is empty',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 28.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Icon(
              Icons.heart_broken_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
