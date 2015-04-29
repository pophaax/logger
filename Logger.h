/*
 * Logger.h
 *
 *  Created on: Apr 29, 2015
 *      Author: sailbot
 */

#ifndef LOGGER_LOGGER_H_
#define LOGGER_LOGGER_H_
#include <string>
#include <boost/date_time/posix_time/posix_time_types.hpp>
#include <boost/log/trivial.hpp>
#include <boost/log/expressions.hpp>
#include <boost/log/sources/severity_logger.hpp>
#include <boost/log/sources/record_ostream.hpp>
#include <boost/log/utility/setup/file.hpp>
#include <boost/log/utility/setup/common_attributes.hpp>
#include <boost/log/support/date_time.hpp>

class Logger {
public:
	Logger();
	/**
	 * set the name of the file you want to log to
	 * return 1 one success
	 */
	bool init(std::string name);
	/**
	 * log info messages
	 */
	void info(std::string message);
	/**
	 * log error messages
	 */
	void error(std::string message);
	virtual ~Logger();

private:
	boost::log::sources::severity_logger< boost::log::trivial::severity_level > lg;
};

#endif /* LOGGER_LOGGER_H_ */
