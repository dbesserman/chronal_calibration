# ChronalCalibration

ChronalCalibration is a proposition of solution to [Chronal Calibration](https://adventofcode.com/2018/day/1) problem.

My take is optimistic in the sense that I expect both the initial frequency and each data variation to be valid integers. Also as the promblem state the computer may
> need to repeat its list of frequency changes many times before a duplicate frequency is found The code can be expanded to manage more complex cases.
I will assume that at some point I will reach a repeated frequency (Otherwise the we would run into an infinit loop)

## Setup

Nothing to do! I've writen the code with elixir 1.9 but I won't be using any of the latest features of the language.

You can run the tests

```
$ mix test
```

## Documentation

The `ChronalCalibration` module is documented according to the hex-doc standard directly in the [the module file](./lib/chronal_calibration.ex).

## Give it a spin!

### Step 1

run

```
$ iex -S mix
iex> ChronalCalibration.computed_frequency(0, "./data/frequency_variations.data")
435
```
see [the module file](./lib/chronal_calibration.ex) for documentation.

### Step 2

run

```
$ iex -S mix
iex> ChronalCalibration.first_frequency_repeated(0, "./data/frequency_variations.data")
245
```
