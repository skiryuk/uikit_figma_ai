import 'package:flutter/cupertino.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_spacing.dart';
import '../../widgets/ui_button.dart';

class ButtonsPage extends StatelessWidget {
  final AppThemeProvider themeProvider;

  const ButtonsPage({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: themeProvider.backgroundColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: themeProvider.backgroundColor,
        middle: Text(
          'Buttons',
          style: AppTextStyles.h2.copyWith(color: themeProvider.textPrimary),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => themeProvider.toggleTheme(),
          child: Icon(
            themeProvider.isDarkMode 
                ? CupertinoIcons.sun_max 
                : CupertinoIcons.moon,
            color: themeProvider.textPrimary,
          ),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.spacing16),
          children: [
            _buildSection(
              'Types - Main Style',
              [
                _buildButtonRow([
                  UiButton(
                    text: 'Accent',
                    type: UiButtonType.accent,
                    style: UiButtonStyle.main,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Neutral',
                    type: UiButtonType.neutral,
                    style: UiButtonStyle.main,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Success',
                    type: UiButtonType.success,
                    style: UiButtonStyle.main,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Critical',
                    type: UiButtonType.critical,
                    style: UiButtonStyle.main,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Types - Minor Style',
              [
                _buildButtonRow([
                  UiButton(
                    text: 'Accent',
                    type: UiButtonType.accent,
                    style: UiButtonStyle.minor,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Neutral',
                    type: UiButtonType.neutral,
                    style: UiButtonStyle.minor,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Success',
                    type: UiButtonType.success,
                    style: UiButtonStyle.minor,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Critical',
                    type: UiButtonType.critical,
                    style: UiButtonStyle.minor,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Sizes',
              [
                _buildButtonRow([
                  UiButton(
                    text: 'Size M',
                    size: UiButtonSize.m,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Size S',
                    size: UiButtonSize.s,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'States',
              [
                _buildButtonRow([
                  UiButton(
                    text: 'Default',
                    state: UiButtonState.defaultState,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Hover',
                    state: UiButtonState.hover,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Disabled',
                    state: UiButtonState.disabled,
                    themeProvider: themeProvider,
                    onPressed: null,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Shapes',
              [
                _buildButtonRow([
                  UiButton(
                    text: 'Squircle',
                    role: UiButtonRole.squircle,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Circle',
                    role: UiButtonRole.circle,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'With Icons',
              [
                _buildButtonRow([
                  UiButton(
                    text: 'Left Icon',
                    leftIcon: CupertinoIcons.heart,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Right Icon',
                    rightIcon: CupertinoIcons.arrow_right,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  UiButton(
                    text: 'Both Icons',
                    leftIcon: CupertinoIcons.heart,
                    rightIcon: CupertinoIcons.arrow_right,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Icon Only',
              [
                Wrap(
                  spacing: AppSpacing.spacing8,
                  runSpacing: AppSpacing.spacing8,
                  children: [
                    UiButton(
                      leftIcon: CupertinoIcons.heart,
                      role: UiButtonRole.squircle,
                      themeProvider: themeProvider,
                      onPressed: () {},
                    ),
                    UiButton(
                      leftIcon: CupertinoIcons.heart,
                      role: UiButtonRole.circle,
                      themeProvider: themeProvider,
                      onPressed: () {},
                    ),
                    UiButton(
                      leftIcon: CupertinoIcons.heart,
                      size: UiButtonSize.s,
                      role: UiButtonRole.squircle,
                      themeProvider: themeProvider,
                      onPressed: () {},
                    ),
                    UiButton(
                      leftIcon: CupertinoIcons.heart,
                      size: UiButtonSize.s,
                      role: UiButtonRole.circle,
                      themeProvider: themeProvider,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'All Combinations',
              [
                _buildCombinationSection(
                  'Accent - Main',
                  UiButtonType.accent,
                  UiButtonStyle.main,
                ),
                const SizedBox(height: 16),
                _buildCombinationSection(
                  'Accent - Minor',
                  UiButtonType.accent,
                  UiButtonStyle.minor,
                ),
                const SizedBox(height: 16),
                _buildCombinationSection(
                  'Neutral - Main',
                  UiButtonType.neutral,
                  UiButtonStyle.main,
                ),
                const SizedBox(height: 16),
                _buildCombinationSection(
                  'Neutral - Minor',
                  UiButtonType.neutral,
                  UiButtonStyle.minor,
                ),
                const SizedBox(height: 16),
                _buildCombinationSection(
                  'Success - Main',
                  UiButtonType.success,
                  UiButtonStyle.main,
                ),
                const SizedBox(height: 16),
                _buildCombinationSection(
                  'Success - Minor',
                  UiButtonType.success,
                  UiButtonStyle.minor,
                ),
                const SizedBox(height: 16),
                _buildCombinationSection(
                  'Critical - Main',
                  UiButtonType.critical,
                  UiButtonStyle.main,
                ),
                const SizedBox(height: 16),
                _buildCombinationSection(
                  'Critical - Minor',
                  UiButtonType.critical,
                  UiButtonStyle.minor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h2.copyWith(color: themeProvider.textPrimary),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildButtonRow(List<Widget> buttons) {
    return Wrap(
      spacing: AppSpacing.spacing8,
      runSpacing: AppSpacing.spacing8,
      children: buttons,
    );
  }

  Widget _buildCombinationSection(
    String title,
    UiButtonType type,
    UiButtonStyle style,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyBold.copyWith(
            color: themeProvider.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: AppSpacing.spacing8,
          runSpacing: AppSpacing.spacing8,
          children: [
            // Size M, Squircle
            UiButton(
              text: 'Button',
              type: type,
              style: style,
              size: UiButtonSize.m,
              role: UiButtonRole.squircle,
              themeProvider: themeProvider,
              onPressed: () {},
            ),
            // Size M, Circle
            UiButton(
              text: 'Button',
              type: type,
              style: style,
              size: UiButtonSize.m,
              role: UiButtonRole.circle,
              themeProvider: themeProvider,
              onPressed: () {},
            ),
            // Size S, Squircle
            UiButton(
              text: 'Button',
              type: type,
              style: style,
              size: UiButtonSize.s,
              role: UiButtonRole.squircle,
              themeProvider: themeProvider,
              onPressed: () {},
            ),
            // Size S, Circle
            UiButton(
              text: 'Button',
              type: type,
              style: style,
              size: UiButtonSize.s,
              role: UiButtonRole.circle,
              themeProvider: themeProvider,
              onPressed: () {},
            ),
            // With icon
            UiButton(
              text: 'Button',
              leftIcon: CupertinoIcons.heart,
              type: type,
              style: style,
              size: UiButtonSize.m,
              role: UiButtonRole.squircle,
              themeProvider: themeProvider,
              onPressed: () {},
            ),
            // Icon only
            UiButton(
              leftIcon: CupertinoIcons.heart,
              type: type,
              style: style,
              size: UiButtonSize.m,
              role: UiButtonRole.squircle,
              themeProvider: themeProvider,
              onPressed: () {},
            ),
            // Disabled
            UiButton(
              text: 'Disabled',
              type: type,
              style: style,
              size: UiButtonSize.m,
              role: UiButtonRole.squircle,
              state: UiButtonState.disabled,
              themeProvider: themeProvider,
              onPressed: null,
            ),
          ],
        ),
      ],
    );
  }
}

