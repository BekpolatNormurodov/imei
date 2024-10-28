import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ProviderScope, StateProvider, Consumer;

final searchingProvider = StateProvider.autoDispose((ref) => false);

// ignore: must_be_immutable
class AnimationSearchBar extends StatelessWidget {
  AnimationSearchBar({
    Key? key,
    this.searchBarWidth,
    this.searchBarHeight,
    this.previousScreen,
    this.closeIconColor,
    this.searchIconColor,
    this.centerTitle,
    this.centerTitleStyle,
    this.searchFieldHeight,
    this.searchFieldDecoration,
    this.cursorColor,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    required this.onChanged,
    required this.searchTextEditingController,
    this.horizontalPadding,
    this.verticalPadding,
    this.isBackButtonVisible,
    this.duration,
  }) : super(key: key);

  ///
  final double? searchBarWidth;
  final double? searchBarHeight;
  final double? searchFieldHeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Widget? previousScreen;
  final Color? closeIconColor;
  final Color? searchIconColor;
  final Color? cursorColor;
  final String? centerTitle;
  final String? hintText;
  final bool? isBackButtonVisible;
  final TextStyle? centerTitleStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Decoration? searchFieldDecoration;
  late Duration? duration;
  final TextEditingController searchTextEditingController;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final newDuration = duration ?? const Duration(milliseconds: 500);
    final newSearchFieldHeight = searchFieldHeight ?? 40;
    final hPadding = horizontalPadding != null ? horizontalPadding! * 2 : 0;
    final newSearchBarWidth =
        searchBarWidth ?? MediaQuery.of(context).size.width - hPadding;
    final isNewBackButtonVisible = isBackButtonVisible ?? true;
    return ProviderScope(
      child: Consumer(builder: (context, ref, __) {
        final isNewSearching = ref.watch(searchingProvider);
        final newSearchNotifier = ref.watch(searchingProvider.notifier);
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 0,
              vertical: verticalPadding ?? 0),
          child: SizedBox(
            width: newSearchBarWidth,
            height: searchBarHeight ?? 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                /// back Button
                isNewBackButtonVisible
                    ? AnimatedOpacity(
                        opacity: isNewSearching ? 0 : 1,
                        duration: newDuration,
                        child: AnimatedContainer(
                            curve: Curves.easeInOutCirc,
                            width: isNewSearching ? 0 : 35,
                            height: isNewSearching ? 0 : 35,
                            duration: newDuration,
                            child: FittedBox()))
                    : AnimatedContainer(
                        curve: Curves.easeInOutCirc,
                        width: isNewSearching ? 0 : 35,
                        height: isNewSearching ? 0 : 35,
                        duration: newDuration),

                /// text
                AnimatedOpacity(
                  opacity: isNewSearching ? 0 : 1,
                  duration: newDuration,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    width: isNewSearching ? 0 : newSearchBarWidth - 100,
                    duration: newDuration,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        centerTitle ?? 'Title',
                        textAlign: TextAlign.center,
                        style: centerTitleStyle ??
                            const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ),
                ),

                /// close search
                AnimatedOpacity(
                  opacity: isNewSearching ? 1 : 0,
                  duration: newDuration,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    width: isNewSearching ? 35 : 0,
                    height: isNewSearching ? 35 : 0,
                    duration: newDuration,
                    child: FittedBox(
                      child: KCustomButton(
                        widget: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Icon(Icons.close,
                                color: closeIconColor ??
                                    Colors.black.withOpacity(.7))),
                        onPressed: () {
                          newSearchNotifier.state = false;
                          searchTextEditingController.clear();
                        },
                      ),
                    ),
                  ),
                ),

                /// input panel
                AnimatedOpacity(
                  opacity: isNewSearching ? 1 : 0,
                  duration: newDuration,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    duration: newDuration,
                    width: isNewSearching
                        ? newSearchBarWidth - 55 - (horizontalPadding ?? 0 * 2)
                        : 0,
                    height: isNewSearching ? newSearchFieldHeight : 20,
                    margin: EdgeInsets.only(
                        left: isNewSearching ? 5 : 0,
                        right: isNewSearching ? 10 : 0),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: searchFieldDecoration ??
                        BoxDecoration(
                            color: Colors.black.withOpacity(.05),
                            border: Border.all(
                                color: Colors.black.withOpacity(.2), width: .5),
                            borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      controller: searchTextEditingController,
                      cursorColor: cursorColor ?? Colors.lightBlue,
                      style: textStyle ??
                          const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: hintText ?? 'Search here...',
                        hintStyle: hintStyle ??
                            const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                      onChanged: onChanged,
                    ),
                  ),
                ),

                ///  search button
                AnimatedOpacity(
                  opacity: isNewSearching ? 0 : 1,
                  duration: newDuration,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    duration: newDuration,
                    width: isNewSearching ? 0 : 35,
                    height: isNewSearching ? 0 : 35,
                    child: FittedBox(
                      child: KCustomButton(
                          widget: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Icon(Icons.search,
                                  size: 35,
                                  color: searchIconColor ??
                                      Colors.black.withOpacity(.7))),
                          onPressed: () => newSearchNotifier.state = true),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class KCustomButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final double? radius;

  const KCustomButton(
      {Key? key,
      required this.widget,
      required this.onPressed,
      this.radius,
      this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 50),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius ?? 50),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor.withOpacity(.2),
          highlightColor: Theme.of(context).primaryColor.withOpacity(.05),
          onTap: onPressed,
          onLongPress: onLongPress,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: widget,
          ),
        ),
      ),
    );
  }
}

class KBackButton extends StatelessWidget {
  final Widget? previousScreen;
  final Color? iconColor;
  final IconData? icon;
  const KBackButton(
      {Key? key,
      required this.previousScreen,
      required this.iconColor,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor.withOpacity(.2),
          highlightColor: Theme.of(context).primaryColor.withOpacity(.05),
          onTap: () async {
            previousScreen == null
                ? Navigator.pop(context)
                : Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => previousScreen!),
                  );
          },
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: SizedBox(
              width: 30,
              height: 30,
              child: Icon(
                icon ?? Icons.arrow_back_ios_new,
                color: iconColor ?? Colors.black.withOpacity(.7),
                size: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}