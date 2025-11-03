import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'freponse.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventProvider>(context, listen: false).fetchEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Football Events')),
      body: Center(
        child: eventProvider.isLoading
            ? const CircularProgressIndicator()
            : eventProvider.errorMessage != null
            ? Text(eventProvider.errorMessage!)
            : ListView.builder(
          itemCount: eventProvider.events.length,
          itemBuilder: (context, index) {
            final e = eventProvider.events[index];
            return Card(
              margin: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 6),
              child: ListTile(
                leading: Image.network(
                  e.strHomeTeamBadge ?? '',
                  width: 40,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.sports_soccer),
                ),
                title: Text('${e.strHomeTeam} vs ${e.strAwayTeam}'),
                subtitle: Text(
                  '${e.strStatus ?? 'Unknown'} • ${e.dateEvent ?? ''}',
                ),
                trailing: Text(e.strTime ?? ''),
              ),
            );
          },
        ),
      ),
    );
  }
}
