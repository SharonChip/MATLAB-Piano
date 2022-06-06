%% final project - main
close all; clear all; clc;

% read notes file:
notes_array = readmatrix('greensleeves_notes.txt','OutputType','string');
% read intervals file:
intervals_array = readmatrix('greensleeves_intervals.xlsx');

% set the frequency
fs = 8000;

% create an array to play the whole song 
play_song = [];

for k = 1:1:length(notes_array)
    % keep adding every note by calling "single note note" function for each note in
    % the notes array.
    play_song(end + 1:1:end + intervals_array(k)*fs) = single_note(notes_array(k), floor(intervals_array(k)*fs)); 
end

%play the whole song
soundsc(play_song, fs);
