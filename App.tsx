import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import React from "react";

function TaskList(props: { tasks: string[] }) :null {
  return null;
}

function TaskForm(props: { onAddTask: (task: string) => void }) :null {
  return null;
}

export default function App() :React.JSX.Element {
  let tasks: string[] = [];
  let addTask = (task: string) :void => { tasks.push(task) };

  return (
    <View style={styles.container}>


      <Text>Open up App.tsx to start working on your app!</Text>
      <StatusBar style="auto" />

      // a list of all tracked tasks
      <TaskList tasks={tasks} />

      // a form to add a new task
      <TaskForm onAddTask={addTask} />

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
