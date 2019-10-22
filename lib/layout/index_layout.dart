import 'package:flutter/material.dart';
import 'package:flutter_widgets/layout/multi_child_layout_widget/custom_multi_child_layout_widget.dart';
import 'package:flutter_widgets/layout/multi_child_layout_widget/list_body_widget.dart';
import 'package:flutter_widgets/layout/multi_child_layout_widget/list_view_widget.dart';
import 'package:flutter_widgets/layout/multi_child_layout_widget/wrap_widget.dart';
import 'single_child_layout_widget/container_widget.dart';
import 'single_child_layout_widget/padding_widget.dart';
import 'single_child_layout_widget/center_widget.dart';
import 'single_child_layout_widget/align_widget.dart';
import 'single_child_layout_widget/fitted_box_widget.dart';
import 'single_child_layout_widget/aspect_ratio_widget.dart';
import 'single_child_layout_widget/constrained_box_widget.dart';
import 'single_child_layout_widget/baseline_widget.dart';
import 'single_child_layout_widget/fractionally_sized_box_widget.dart';
import 'single_child_layout_widget/intrinsic_height_widget.dart';
import 'single_child_layout_widget/intrinsic_width_widget.dart';
import 'single_child_layout_widget/limited_box_widget.dart';
import 'single_child_layout_widget/offstage_widget.dart';
import 'single_child_layout_widget/overflow_box_widget.dart';
import 'single_child_layout_widget/sized_box_widget.dart';
import 'single_child_layout_widget/sized_overflow_box_widget.dart';
import 'single_child_layout_widget/transform_widget.dart';
import 'single_child_layout_widget/custom_single_child_layout_widget.dart';

import 'multi_child_layout_widget/row_widget.dart';
import 'multi_child_layout_widget/column_widget.dart';
import 'multi_child_layout_widget/stack_widget.dart';
import 'multi_child_layout_widget/indexed_stack_widget.dart';
import 'multi_child_layout_widget/flow_widget.dart';
import 'multi_child_layout_widget/table_widget.dart';

class IndexLayout extends StatefulWidget {
  @override
  _IndexLayoutState createState() => _IndexLayoutState();
}

class _IndexLayoutState extends State<IndexLayout> {
  List<Map> page1;
  List<Map> page2;

  @override
  void initState() {
    super.initState();
    page1 = [
      {'title': 'Container', 'page': ContainerWidget()},
      {'title': 'Padding', 'page': PaddingWidget()},
      {'title': 'Center', 'page': CenterWidget()},
      {'title': 'Align', 'page': AlignWidget()},
      {'title': 'FittedBox', 'page': FittedBoxWidget()},
      {'title': 'AspectRatio', 'page': AspectRatioWidget()},
      {'title': 'ConstrainedBox', 'page': ConstrainedBoxWidget()},
      {'title': 'Baseline', 'page': BaselineWidget()},
      {'title': 'FractionallySizedBox', 'page': FractionallySizedBoxWidget()},
      {'title': 'IntrinsicHeight', 'page': IntrinsicHeightWidget()},
      {'title': 'IntrinsicWidth', 'page': IntrinsicWidthWidget()},
      {'title': 'LimitedBox', 'page': LimitedBoxWidget()},
      {'title': 'Offstage', 'page': OffstageWidget()},
      {'title': 'OverflowBox', 'page': OverflowBoxWidget()},
      {'title': 'SizedBox', 'page': SizedBoxWidget()},
      {'title': 'SizedOverflowBox', 'page': SizedOverflowBoxWidget(), 'finish': false},
      {'title': 'Transform', 'page': TransformWidget()},
      {'title': 'CustomSingleChildLayout', 'page': CustomSingleChildLayoutWidget(), 'finish': false},
    ];
    page2 = [
      {'title': 'Row', 'page': RowWidget()},
      {'title': 'Column', 'page': ColumnWidget()},
      {'title': 'Stack', 'page': StackWidget()},
      {'title': 'IndexedStack', 'page': IndexedStackWidget()},
      {'title': 'Flow', 'page': FlowWidget()},
      {'title': 'Table', 'page': TableWidget()},
      {'title': 'Wrap', 'page': WrapWidget()},
      {'title': 'ListBody', 'page': ListBodyWidget()},
      {'title': 'ListView', 'page': ListViewWidget()},
      {'title': 'CustomMultiChildLayout', 'page': CustomMultiChildLayoutWidget()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(children: <Widget>[
        buildTitle('拥有单个子元素的布局widget'),
        buildColumnItem(page1),
        buildTitle('拥有多个子元素的布局widget'),
        buildColumnItem(page2),
      ]),
    );
  }

  Widget buildTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      color: Color(0xffd3d3d3),
      child: Text(title),
    );
  }

  Widget buildColumnItem(List<Map> page) {
    return Column(
      children: page.map((item) {
        return ListTile(
          title: Text(item['title'], style: TextStyle(color: item['finish'] == null ? Colors.black : Colors.red)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
          },
        );
      }).toList(),
    );
  }
}
