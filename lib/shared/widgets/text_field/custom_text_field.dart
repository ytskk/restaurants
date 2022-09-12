import 'package:flutter/material.dart';

enum TextFieldStyle {
  solid,
  outlined;
}

const BorderRadius _defaultBorderRadius = BorderRadius.all(Radius.circular(6));

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.placeholder,
    this.onChanged,
    this.validator,
    this.suffix,
    this.prefix,
    this.obscureText = false,
    this.autofillHints,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
  })  : _textFieldStyle = TextFieldStyle.solid,
        assert(obscureText == false || suffix == null,
            'suffix and obscureText cannot be used together'),
        super(key: key);

  const CustomTextField.outlined({
    Key? key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.placeholder,
    this.onChanged,
    this.validator,
    this.suffix,
    this.prefix,
    this.obscureText = false,
    this.autofillHints,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
  })  : _textFieldStyle = TextFieldStyle.outlined,
        assert(obscureText == false || suffix == null,
            'suffix and obscureText cannot be used together'),
        super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator? validator;
  final TextFieldStyle _textFieldStyle;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscureText;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;
  final int? maxLines;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final FocusNode _focusNode;
  late final TextEditingController _controller;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();
    _obscureText = widget.obscureText;
  }

  @override
  void dispose() {
    super.dispose();

    _focusNode.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: widget.autofillHints,
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: _obscureText,
      decoration: _buildDecoration(context),
      onChanged: widget.onChanged,
      validator: widget.validator,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      // TODO: dumb hack to make the text field read only.
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
        if (widget.readOnly) {
          _focusNode.unfocus();
        }
      },
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    switch (widget._textFieldStyle) {
      case TextFieldStyle.solid:
        return _buildSolidDecoration(context);
      case TextFieldStyle.outlined:
        return _buildOutlinedDecoration(context);
    }
  }

  InputDecoration _buildSolidDecoration(BuildContext context) {
    return _buildBaseInputDecoration(context);
  }

  InputDecoration _buildOutlinedDecoration(BuildContext context) {
    final theme = Theme.of(context);

    return _buildBaseInputDecoration(context).copyWith(
      fillColor: theme.colorScheme.surface.withOpacity(0.2),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: _defaultBorderRadius,
        borderSide: BorderSide(
          color: theme.colorScheme.outline,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _defaultBorderRadius,
        borderSide: BorderSide(
          color: theme.colorScheme.outline,
        ),
      ),
      // focused border none
      focusedBorder: OutlineInputBorder(
        borderRadius: _defaultBorderRadius,
        borderSide: BorderSide(
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  InputDecoration _buildBaseInputDecoration(BuildContext context) {
    return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
      hintText: widget.placeholder,
      hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            fontWeight: FontWeight.w400,
          ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
      suffix: widget.obscureText
          ? _buildShowPasswordSuffix(context)
          : widget.suffix,
      prefixIcon: widget.prefix,
    );
  }

  Widget _buildShowPasswordSuffix(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      child: Icon(
        _obscureText ? Icons.visibility : Icons.visibility_off,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
