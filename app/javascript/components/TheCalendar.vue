<template>
  <div class="main-content">
    <v-date-picker
      ref="picker"
      v-model="date"
      full-width
      no-title
      color="primary"
      event-color="pink"
      :weekday-format="weekdayFormat"
      :allowed-dates="allowedDates"
      :events="tweetDates"
      class="mt-4"
      @input="inputDate"
    />
  </div>
</template>

<script>
import dayjs from "dayjs"

export default {
  props: {
    tweetDates: {
      type: Array,
      default: () => [],
      required: true
    }
  },
  data() {
    return {
      date: ""
    }
  },
  watch: {
    $route() {
      this.date = ""
      this.$refs.picker.activePicker = "DATE"
    }
  },
  methods: {
    allowedDates(val) {
      return this.tweetDates.includes(val)
    },
    weekdayFormat(val) {
      return dayjs(val).format("dd")
    },
    inputDate(date) {
      this.$emit("input-date", date)
    }
  }
}
</script>
