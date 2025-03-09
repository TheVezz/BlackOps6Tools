import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class _MappingState {
  final Map<String, String> mapping;
  final String selectedLetter;
  _MappingState({required this.mapping, required this.selectedLetter});
}

bool _areMappingStatesEqual(_MappingState a, _MappingState b) {
  return mapEquals(a.mapping, b.mapping);
}

class Dri11Tool extends StatefulWidget {
  const Dri11Tool({super.key});

  @override
  State<Dri11Tool> createState() => _Dri11ToolState();
}

class _Dri11ToolState extends State<Dri11Tool> {
  final Map<String, int> iconValues = {
    "icon1": 0,
    "icon2": 10,
    "icon3": 11,
    "icon4": 20,
    "icon5": 21,
    "icon6": 22,
  };

  static const String assetBasePath = "assets/images/maps/terminus/dri11/";

  String selectedLetter = "X";

  final Map<String, String> selectedMapping = {};
  final List<_MappingState> _mappingHistory = [];

  @override
  void initState() {
    super.initState();
    _saveState();
  }

  void _saveState() {
    final newState = _MappingState(mapping: Map.from(selectedMapping), selectedLetter: selectedLetter);
    if (_mappingHistory.isEmpty || !_areMappingStatesEqual(_mappingHistory.last, newState)) {
      _mappingHistory.add(newState);
      debugPrint("Salvato stato: mapping=${selectedMapping.toString()}, active=$selectedLetter");
    }
  }

  void _resetState() {
    setState(() {
      selectedMapping.clear();
      selectedLetter = "X";
      _mappingHistory.clear();
      _mappingHistory.add(_MappingState(mapping: {}, selectedLetter: selectedLetter));
      debugPrint("Reset: Stato ripristinato alle impostazioni iniziali.");
    });
  }

  void updateSelectedLetter() {
    if (selectedMapping.length < 3) {
      if (!selectedMapping.containsValue("X")) {
        selectedLetter = "X";
      } else if (!selectedMapping.containsValue("Y")) {
        selectedLetter = "Y";
      } else if (!selectedMapping.containsValue("Z")) {
        selectedLetter = "Z";
      }
    } else {
      selectedLetter = "";
    }
  }

  Widget buildLetterButton(String letter) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: letter == selectedLetter ? theme.colorScheme.primary : theme.colorScheme.surfaceContainerHighest,
        ),
        onPressed: () {
          setState(() {
            selectedLetter = selectedLetter == letter ? "" : letter;
            _saveState();
          });
        },
        child: Text(
          letter,
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 24, color: theme.colorScheme.onPrimary),
        ),
      ),
    );
  }

  Widget buildIconButton(String iconKey) {
    final theme = Theme.of(context);
    final bool isSelected = selectedMapping.containsKey(iconKey);
    return SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.surface,
          padding: EdgeInsets.zero,
        ),
        onPressed: selectedLetter.isEmpty || isSelected
            ? null
            : () {
                setState(() {
                  _saveState();
                  String? oldIcon = selectedMapping.entries.firstWhere((entry) => entry.value == selectedLetter, orElse: () => const MapEntry("", "")).key;
                  if (oldIcon.isNotEmpty) {
                    selectedMapping.remove(oldIcon);
                  }
                  selectedMapping[iconKey] = selectedLetter;
                  debugPrint("Associato $iconKey a $selectedLetter");
                  updateSelectedLetter();
                  _saveState();
                });
              },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "$assetBasePath$iconKey.webp",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey,
                    child: const Center(child: Text("N/A")),
                  );
                },
              ),
            ),
            if (isSelected)
              Text(
                selectedMapping[iconKey]!,
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.orange),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildUndoButton() {
    return ElevatedButton.icon(
      onPressed: _mappingHistory.length < 2
          ? null
          : () {
              setState(() {
                _mappingHistory.removeLast();
                final _MappingState previous = _mappingHistory.last;
                selectedMapping
                  ..clear()
                  ..addAll(previous.mapping);
                selectedLetter = previous.selectedLetter;
                debugPrint("Undo: Ripristinato stato: ${previous.mapping}, active=${previous.selectedLetter}");
              });
            },
      icon: const Icon(Icons.undo),
      label: const Text("Undo"),
    );
  }

  Widget buildResetButton() {
    return ElevatedButton.icon(
      onPressed: selectedMapping.isEmpty
          ? null
          : () {
              setState(() {
                _resetState();
              });
            },
      icon: const Icon(Icons.restart_alt),
      label: const Text("Reset"),
    );
  }

  Widget buildLetterButtons() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: ["X", "Y", "Z"].map(buildLetterButton).toList(),
    );
  }

  Widget buildIconButtons() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: iconValues.keys.map(buildIconButton).toList(),
    );
  }

  Widget buildControlButtons() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        buildUndoButton(),
        buildResetButton(),
      ],
    );
  }

  /// Calcola i risultati in base alle associazioni.
  String computeResults() {
    if (selectedMapping.length == 3) {
      int? X, Y, Z;
      selectedMapping.forEach((icon, letter) {
        if (letter == "X") {
          X = iconValues[icon];
        } else if (letter == "Y") {
          Y = iconValues[icon];
        } else if (letter == "Z") {
          Z = iconValues[icon];
        }
      });
      if (X != null && Y != null && Z != null) {
        final int risultato1 = 2 * X! + 11;
        final int risultato2 = (2 * Z! + Y!) - 5;
        final int risultato3 = (Y! + Z!) - X!;
        return "$risultato1   $risultato2   $risultato3";
      }
    }
    return "- - -";
  }

  Widget buildTextRow(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.thecode,
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          computeResults(),
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildLetterButtons(),
          const SizedBox(height: 16),
          buildControlButtons(),
          const SizedBox(height: 16),
          buildIconButtons(),
          const SizedBox(height: 16),
          buildTextRow(context),
        ],
      ),
    );
  }
}
