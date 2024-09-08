#include "applicationmodel.h"

ApplicationModel::ApplicationModel()
    : QQuickItem()
    , m_leftPanelVisible(false)
    , m_rightPanelVisible(false)
    , m_parametersList()
{
    m_maxValue = m_parametersList.getMaxValue();
    connect(&m_parametersList, &ParametersListModel::maxValueChanged, this, &ApplicationModel::onMaxValueChanged);
}

QAbstractListModel* ApplicationModel::parametersList()
{
    return &m_parametersList;
}

bool ApplicationModel::leftPanelVisible() const
{
    return m_leftPanelVisible;
}

bool ApplicationModel::rightPanelVisible() const
{
    return m_rightPanelVisible;
}

double ApplicationModel::maxValue() const
{
    return m_maxValue;
}

void ApplicationModel::setLeftPanelVisible(bool value)
{
    if (m_leftPanelVisible != value)
    {
        m_leftPanelVisible = value;
        emit leftPanelVisibleChanged();
    }
}

void ApplicationModel::setRightPanelVisible(bool value)
{
    if (m_rightPanelVisible != value)
    {
        m_rightPanelVisible = value;
        emit rightPanelVisibleChanged();
    }
}

void ApplicationModel::setMaxValue(double value)
{
    if (m_maxValue != value)
    {
        m_maxValue = value;
        emit maxValueChanged();
    }
}

void ApplicationModel::onMaxValueChanged(double value)
{
    setMaxValue(value);
}
