import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _MappingState {
  final Map<String, String> mapping;
  final String selectedNumber;
  _MappingState({required this.mapping, required this.selectedNumber});
}

bool _areMappingStatesEqual(_MappingState a, _MappingState b) {
  return mapEquals(a.mapping, b.mapping);
}

class RunePuzzleTool extends StatefulWidget {
  const RunePuzzleTool({super.key});

  @override
  State<RunePuzzleTool> createState() => _RunePuzzleToolState();
}

class _RunePuzzleToolState extends State<RunePuzzleTool> {
  static const String assetBasePath = "assets/images/maps/citadelle_des_morts/rune_puzzle/";
  final List<String> svgIcons = List.generate(20, (index) => "${index + 1}.svg");
  final List<String> romanNumbers = ["I", "II", "III", "IV", "V", "VI"];
  String selectedNumber = "I";
  final Map<String, String> selectedMapping = {};
  final List<_MappingState> _mappingHistory = [];

  @override
  void initState() {
    super.initState();
    _saveState();
  }

  void _saveState() {
    final newState = _MappingState(mapping: Map.from(selectedMapping), selectedNumber: selectedNumber);
    if (_mappingHistory.isEmpty || !_areMappingStatesEqual(_mappingHistory.last, newState)) {
      _mappingHistory.add(newState);
      debugPrint("Salvato stato: mapping=${selectedMapping.toString()}, active=$selectedNumber");
    }
  }

  void _resetState() {
    setState(() {
      selectedMapping.clear();
      selectedNumber = "I";
      _mappingHistory.clear();
      _mappingHistory.add(_MappingState(mapping: {}, selectedNumber: selectedNumber));
      debugPrint("Reset: Stato ripristinato alle impostazioni iniziali.");
    });
  }

  void updateSelectedNumber() {
    for (String num in romanNumbers) {
      if (!selectedMapping.values.contains(num)) {
        selectedNumber = num;
        return;
      }
    }
    selectedNumber = "";
  }

  Widget buildNumberButton(String number) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: number == selectedNumber ? theme.colorScheme.primary : theme.colorScheme.surfaceContainerHighest,
        ),
        onPressed: () {
          setState(() {
            selectedNumber = selectedNumber == number ? "" : number;
            _saveState();
          });
        },
        child: Text(
          number,
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
          backgroundColor: isSelected
              ? theme.colorScheme.primary.withAlpha(127) // Sfondo evidenziato SOLO per le rune assegnate
              : theme.colorScheme.surface, // Sfondo normale per tutte le altre rune
          padding: EdgeInsets.zero,
        ),
        onPressed: selectedNumber.isEmpty || isSelected
            ? null
            : () {
                setState(() {
                  _saveState();
                  String? oldIcon = selectedMapping.entries.firstWhere((entry) => entry.value == selectedNumber, orElse: () => const MapEntry("", "")).key;
                  if (oldIcon.isNotEmpty) {
                    selectedMapping.remove(oldIcon);
                  }
                  selectedMapping[iconKey] = selectedNumber;
                  debugPrint("Associato $iconKey a $selectedNumber");
                  updateSelectedNumber();
                  _saveState();
                });
              },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                "$assetBasePath$iconKey",
                width: 60,
                height: 60,
                fit: BoxFit.contain,
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
                selectedNumber = previous.selectedNumber;
                debugPrint("Undo: Ripristinato stato: ${previous.mapping}, active=${previous.selectedNumber}");
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

  Widget buildNumberButtons() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: romanNumbers.map(buildNumberButton).toList(),
    );
  }

  Widget buildUndoResetButtons() {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildNumberButtons(),
          const SizedBox(height: 16),
          buildUndoResetButtons(),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: svgIcons.map(buildIconButton).toList(),
          ),
        ],
      ),
    );
  }
}
