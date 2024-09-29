package com.example.lab1

import androidx.compose.ui.res.stringResource
import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow


class MainViewModel: ViewModel() {
    private val _text = MutableStateFlow("Hello from View!")
    val text: StateFlow<String> = _text

    fun changeText() {
        _text.value = "Text was changed by button click!"
    }
}