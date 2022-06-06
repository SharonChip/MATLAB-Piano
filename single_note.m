%% final project - single_note
function [tone] = single_note(note, N)
% The piano notes array
piano_notes = ["A3","As3","B3","C4","Cs4","D4","Ds4","E4","F4","Fs4","G4","Gs4","A4","As4","B4","C5"];
% set A3 to be the base note with 220Hz
base_frequency = 220; % the frequency of the lowest note

% set the frequency
fs = 8000;

%% calculate the frequency of the note
% find the place of the given note in the array
note_location = find(piano_notes == note);

% using f = fb * 2^(1*(n-1)/12), n - the notes location in the piano array,
% fb - the base frequency A3
note_frequency = base_frequency * 2.^(1*(note_location - 1)/12);

%% calculate the tone
% set the time vec using N - note's interval * fs;
t = (0:1:N-1)./fs;

y = sin(2 * pi * note_frequency .* t) .* exp(-0.0015 * 2 * pi * note_frequency .* t);

y = y + 0.6*sin(1 * 2 * pi * note_frequency .* t) .* exp(-0.0015 * 2 * pi * note_frequency .* t);
y = y + 0.4*sin(2 * 2 * pi * note_frequency .* t) .* exp(-0.0015 * 2 * pi * note_frequency .* t);

y = y + y.*y.*y;

tone = y .* (1 + 16 .* t .* exp(-5 .* t));

end
