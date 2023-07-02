part of '../pokemon_detail_screen.dart';

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    Key? key,
    required this.title,
    this.infoValue,
    this.additionalWidget,
    this.spacing = 60,
  }) : super(key: key);
  final String title;
  final String? infoValue;
  final Widget? additionalWidget;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Row(
          children: [
            if (infoValue != null)
              Expanded(
                flex: 1,
                child: Text(
                  infoValue!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            if (additionalWidget != null)
              Expanded(flex: 3, child: additionalWidget!),
          ],
        ),
      ),
    ]);
  }
}
